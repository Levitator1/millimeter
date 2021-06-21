#pragma once

/*
 *
 * Stuff involving the global state of the MCU
 * 
 */

#include "avr/regdef.hpp"
#include "avr/device_property.hpp"

namespace levitator{
namespace avr{

/*
 *   Not much point in accepting parametric registers or bits since this is
 *   system-global stuff that's not going to get instanced.
 */

class System{
            
public:    
    using mcucr_type = SREG8ADDR(MCUCR);
    using pud_bit_type = sbitno<PUD>;
    
    using prr_type = SREG8ADDR(PRR);
    using pradc_type = sbitno<PRADC>;
    
    //Globally disables all DIO pullup resistors
    static bit_property<mcucr_type, pud_bit_type> pullup_disable_bit;
    
    //Shuts down the ADC systems, which must be disabled first
    static bit_property<prr_type, pradc_type> adc_power_reduction_bit;
};

}
}