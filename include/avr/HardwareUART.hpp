#pragma once

//#include "avr/io.h"
#include <avr/io.h>
#include <stdio.h>
#include <assert.h>
#include "avr_types.hpp"
//#include "Config.hpp"
#include "file.hpp"
#include "../util/meta.hpp"

namespace levitator{
namespace avr{

//define shared_config before including this header
    
template<typename Regs, ulong system_clock = levitator::shared_config::system_clock>
class HardwareUART;

//The same as stdio FILE, but with an extra field so that HardwareUART<> can
//respond to it.
template<typename Regs>
struct UART_FILE:public FILE_EX{
    using uart_type = HardwareUART<Regs>;
    uart_type &uart;
    
    UART_FILE(uart_type &u):
        uart(u){}
    
    int available() const override{
        return uart.available();
    }
};
    
template<class RegList, class BitList>
struct SHardwareUARTRegs{
    using regs = RegList;
    using bits = BitList;
    
    template<int I>
    using regtype = meta::type_i<regs, I>;
    
    static meta::type_i<regs, 0> ubrrx;
    static meta::type_i<regs, 1> ucsrxa;
    static meta::type_i<regs, 2> ucsrxb;
    static meta::type_i<regs, 3> ucsrxc;
    static meta::type_i<regs, 4> udrx;    

    static constexpr bit_number 
        u2xx_bit = meta::value_i<bits, 0>::value,
        rxcx_bit = meta::value_i<bits, 1>::value,
        ucszx0_bit = meta::value_i<bits, 2>::value,
        ucszx1_bit = meta::value_i<bits, 3>::value,
        rxenx_bit = meta::value_i<bits, 4>::value,
        txenx_bit = meta::value_i<bits, 5>::value,
        udrex_bit = meta::value_i<bits, 6>::value;
};

template<class Regs, class Bits>
meta::type_i<Regs, 0> SHardwareUARTRegs<Regs, Bits>::ubrrx = {};

template<class Regs, class Bits>
meta::type_i<Regs, 1> SHardwareUARTRegs<Regs, Bits>::ucsrxa = {};

template<class Regs, class Bits>
meta::type_i<Regs, 2> SHardwareUARTRegs<Regs, Bits>::ucsrxb = {};

template<class Regs, class Bits>
meta::type_i<Regs, 3> SHardwareUARTRegs<Regs, Bits>::ucsrxc = {};

template<class Regs, class Bits>
meta::type_i<Regs, 4> SHardwareUARTRegs<Regs, Bits>::udrx = {};


//The system clock must be known to calculate the clock divisors to arrive
//at the actual baud rate
template<typename Regs, ulong system_clock>
class HardwareUART{
public:   
    using regs_type = Regs;    
    using file_type = UART_FILE<Regs>;
    
private:
    regs_type m_regs;

protected:
    static inline file_type *upcast_file(FILE *f){
        return static_cast<file_type *>(f);
    }
    
    //These two functions are callbacks for the AVR API to route I/O via stdio
    static int stdio_write(char u8Data, FILE *stream){
        auto f = upcast_file(stream);
        return f->uart.write(u8Data);
    }

    static int stdio_read(FILE *stream){
        auto f = upcast_file(stream);
        return f->uart.read();
    }
    
    //Same as stdio_write, but it converts lf to cr/lf
    static int tty_write(char u8Data, FILE *stream){
        auto f = upcast_file(stream);
        int result;
        if(u8Data == '\n')
            if((result=f->uart.write('\r')) != 0)
                return result;
        return f->uart.write(u8Data);
    }
    
    static int tty_read(FILE *stream){
        return stdio_read(stream);
    }
    
public:
    HardwareUART(uint baud, const regs_type &regs = {} ):
        m_regs(regs){
        
        regs.ubrrx = (uint16_t)((system_clock / (baud * 16UL))) - 1;
                        
        //DEBUG
        
        volatile int blarg;
        //auto blah = regs.ubrrx.debug_pointer();
        //assert(blah == &UBRR0);
        auto blah2 = regs.ubrrx.reg;
        auto addr = regs.ubrrx.address;
        //auto blah = &regs.ubrrx.get();
        //auto blah2 = regs.ubrrx.address;
        
        //Disable baud doubling
        regs.ucsrxa &= ~_BV(regs.u2xx_bit);
        
        // Set frame format to 8 data bits, no parity, 1 stop bit
        regs.ucsrxc |= _BV(regs.ucszx1_bit) | _BV(regs.ucszx0_bit);
                       
        //enable transmission and reception
        regs.ucsrxb |= _BV(regs.rxenx_bit) | _BV(regs.txenx_bit);
    }
    
    //Pointer to this can be assigned directly to both global stdin and stdout without conflict
    file_type make_stdio_file(){        
        file_type result{*this};
        fdev_setup_stream(&result, &stdio_write, &stdio_read, _FDEV_SETUP_RW);
        return result;
    }
    
    file_type make_tty_stream(){
        file_type result{*this};
        fdev_setup_stream(&result, &tty_write, &tty_read, _FDEV_SETUP_RW);
        return result;
    }
        
    inline int read(){
        uint8_t u8Data;
        // Wait for byte to be received
        while(!available()){};
        u8Data=m_regs.udrx.get();
        
        // Return received data
        return u8Data;
    }
    
    inline int write(char ch){
        //wait while previous byte is completed
        while(!(m_regs.ucsrxa & _BV(m_regs.udrex_bit))){};
        
        // Transmit data
        m_regs.udrx = ch;
        return 0;
    }
    
    inline int available() const{
        return (m_regs.ucsrxa & _BV(m_regs.rxcx_bit)) ? 1 : 0;
    }    
};

    
}
}

#if defined( __ATmega328P__ )
#   include "atmega328p/DeviceUARTs.hpp"
#endif

