#pragma once

//#include "avr/io.h"
#include <avr/io.h>
#include <stdio.h>
#include "avr_types.hpp"
//#include "Config.hpp"
#include "file.hpp"

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

template<
    class Ubrrx,
    class Ucsrxa,
    class Ucsrxb,
    class Ucsrxc,
    class Udrx,
    bit_number U2XX_bit,
    bit_number RXCX_bit,
    bit_number UCSZX0_bit,
    bit_number UCSZX1_bit,
    bit_number RXENX_bit,
    bit_number TXENX_bit,
    bit_number UDREX_bit
>
struct SHardwareUARTRegs{    
    static Ubrrx ubrrx;
    static Ucsrxa ucsrxa;
    static Ucsrxb ucsrxb;
    static Ucsrxc ucsrxc;
    static Udrx udrx;    

    static constexpr bit_number 
        u2xx_bit = U2XX_bit,
        rxcx_bit = RXCX_bit,
        ucszx0_bit = UCSZX0_bit,
        ucszx1_bit = UCSZX1_bit,
        rxenx_bit = RXENX_bit,
        txenx_bit = TXENX_bit,
        udrex_bit = UDREX_bit;             
};



//The system clock must be known to calculate the clock divisors to arrive
//at the actual baud rate
template<typename Regs, ulong system_clock>
class HardwareUART{
public:   
    using regs_type = Regs;    
    using file_type = UART_FILE<Regs>;
    
private:
    const regs_type m_regs;

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
    
public:
    HardwareUART(uint baud, const regs_type &regs = {} ):
        m_regs(regs){
        
        regs.ubrrx.get() = (uint16_t)((system_clock / (baud * 16UL))) - 1;
        
        //Disable baud doubling
        regs.ucsrxa.get() &= ~_BV(regs.u2xx_bit);
        
        // Set frame format to 8 data bits, no parity, 1 stop bit
        regs.ucsrxc.get() |= _BV(regs.ucszx1_bit) | _BV(regs.ucszx0_bit);
                       
        //enable transmission and reception
        regs.ucsrxb.get() |= _BV(regs.rxenx_bit) | _BV(regs.txenx_bit);
    }
    
    //Pointer to this can be assigned directly to both global stdin and stdout without conflict
    file_type make_stdio_file(){        
        file_type result{*this};
        fdev_setup_stream(&result, &stdio_write, &stdio_read, _FDEV_SETUP_RW);
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
        while(!(m_regs.ucsrxa.get() & _BV(m_regs.udrex_bit))){};
        
        // Transmit data
        m_regs.udrx.get() = ch;
        return 0;
    }
    
    inline int available() const{
        return (m_regs.ucsrxa.get() & _BV(m_regs.rxcx_bit)) ? 1 : 0;
    }    
};

    
}
}

#if defined( __ATmega328P__ )
#   include "atmega328p/DeviceUARTs.hpp"
#endif

