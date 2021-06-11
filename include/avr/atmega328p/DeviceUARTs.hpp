#pragma once

/*
 *
 *  MCU-specific UART definitions
 * 
 */

#include <avr/io.h>
#include "../avr_types.hpp"
#include "../HardwareUART.hpp"

namespace levitator{
namespace avr{

//constexpr uint funk( ioreg8 reg ){
//    return reinterpret_cast<uint>(&reg);
//}
    
template<regptr<ioreg8> R>
struct Test2{};

//Test2<reinterpret_cast<uint>(&UCSR0A)> blah;
//Test2<&UCSR0A> blah;

//struct Blah{
//    static constexpr regptr<ioreg16> ubrr0 = &UBRR0;
//};

//regptr<ioreg16> Blah::ubrr0 = &UBRR0;
    
//using Test = HardwareUARTRegs<&UBRR0, &UCSR0A, &UCSR0B, &UCSR0C, &UDR0, U2X0, RXC0, UCSZ01, TXEN0>; 
//using Test = HardwareUARTRegs< Blah::ubrr0 >;


/*
 * template<
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
 */
struct UART0Regs:public SHardwareUARTRegs< 
    meta::types<SREG16ADDR(UBRR0),
        SREG8ADDR(UCSR0A),SREG8ADDR(UCSR0B), SREG8ADDR(UCSR0C), SREG8ADDR(UDR0)>,
    meta::values<bit_number,
        U2X0, RXC0, UCSZ00, UCSZ01, RXEN0, TXEN0, UDRE0>>{};

    
struct UART0 : public HardwareUART<UART0Regs>{
private:
    using base_type = HardwareUART<UART0Regs>;
public:
    UART0(ulong baud):
        base_type(baud){}
};

}
}