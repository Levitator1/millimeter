#pragma once

/*
 *
 *  MCU-specific UART definitions
 * 
 */
#include <avr/io.h>
#include "avr_types.hpp"
#include "HardwareUART.hpp"

namespace levitator{
namespace avr{

struct UART0Regs:public HardwareUARTRegs< 
    meta::types<SREG16ADDR(UBRR0),
        SREG8ADDR(UCSR0A),SREG8ADDR(UCSR0B), SREG8ADDR(UCSR0C), SREG8ADDR(UDR0)>,
    meta::types<sbitno<U2X0>, sbitno<RXC0>, sbitno<UCSZ00>, sbitno<UCSZ01>,
        sbitno<RXEN0>, sbitno<TXEN0>, sbitno<UDRE0>>
    >{};

    
struct UART0 : public HardwareUART<UART0Regs>{
private:
    using base_type = HardwareUART<UART0Regs>;
public:
    UART0(ulong baud):
        base_type(baud){}
};

}
}