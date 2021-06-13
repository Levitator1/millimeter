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
struct HardwareUARTRegs{
private:
    meta::assert_size_field<RegList, 5> check_reg_count;
    meta::assert_size_field<BitList, 7> check_bit_count;
        
public:    
    template<int I>
    using regtype = meta::type_i<RegList, I>;
    
    template<int I>
    using bittype = meta::type_i<BitList, I>;
    
    regtype<0> ubrrx;
    regtype<1> ucsrxa;
    regtype<2> ucsrxb;
    regtype<3> ucsrxc;
    regtype<4> udrx;
    
    bittype<0> u2xx_bit;
    bittype<1> rxcx_bit;
    bittype<2> ucszx0_bit;
    bittype<3> ucszx1_bit;
    bittype<4> rxenx_bit;
    bittype<5> txenx_bit;
    bittype<6> udrex_bit;       
};

template<typename Guard = atomic_guard>
struct DHardwareUARTRegs: HardwareUARTRegs< 
    meta::types< dreg16addr<Guard>, dreg8addr<Guard>, dreg8addr<Guard>, dreg8addr<Guard>, dreg8addr<Guard> >,
    typename meta::fill_type_list<bit_number, 7>::type
>{
    
};


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
        
        m_regs.ubrrx = (uint16_t)((system_clock / (baud * 16UL))) - 1;
                        
        //DEBUG
        
        volatile int blarg;
        //auto blah = regs.ubrrx.debug_pointer();
        //assert(blah == &UBRR0);
        //auto blah2 = regs.ubrrx.reg;
        //auto addr = regs.ubrrx.address;
        //auto blah = &regs.ubrrx.get();
        //auto blah2 = regs.ubrrx.address;
        
        //Disable baud doubling
        m_regs.ucsrxa &= ~_BV(regs.u2xx_bit);
        
        // Set frame format to 8 data bits, no parity, 1 stop bit
        m_regs.ucsrxc |= _BV(regs.ucszx1_bit) | _BV(regs.ucszx0_bit);
                       
        //enable transmission and reception
        m_regs.ucsrxb |= _BV(regs.rxenx_bit) | _BV(regs.txenx_bit);
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

