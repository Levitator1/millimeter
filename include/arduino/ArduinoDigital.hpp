#pragma once

#include "../util/meta.hpp"
#include "../avr/regdef.hpp"
#include "../avr/Digital.hpp"

//
// The main header to import digital I/O definitions for an Arduino
// Currently only the Pro Mini/atmega328p is defined, but it shouldn't be too hard to add more
//

namespace levitator{
namespace arduino{
    
//Map I to each register definition
template< int I >
struct DigitalPinRegMap{
    static constexpr bool undefined = true;
};

#define DEFINE_DIGITAL_PIN_REGS(i, port, pin) \
template<> \
struct DigitalPinRegMap<i>:public ::levitator::avr::DIORegs< \
    levitator::meta::types< \
        SREGADDR(DDR##port), \
        SREGADDR(PORT##port), \
        SREGADDR(PIN##port)>, \
    levitator::meta::types< \
                ::levitator::avr::sbitno<DD##port##pin>, \
                ::levitator::avr::sbitno<PORT##port##pin>, \
                ::levitator::avr::sbitno<PIN##port##pin> \
        >>{  \
        static constexpr bool undefined = false;  \
};

template<int I>
using ArduinoDigital = avr::Digital<DigitalPinRegMap<I>>;
    
    
/*
//Just takes avr::Digital and attaches a static singleton to it
template<int I>
class ArduinoDigital:public avr::Digital< DigitalPinRegs<I> >{
    using base_type = avr::Digital< DigitalPinRegs<I> >;
    using base_type::base_type;
public:
    ArduinoDigital instance;
};
*/
/*
template<int I>
ArduinoDigital<I> ArduinoDigital<I>::instance = {};

namespace impl{
    template< typename OrdinalList >
    class DigitalWiring_impl;
    
    template<typename... I>
    class DigitalWiring_impl< meta::types<I...> >{
        static avr::DigitalInterface *digital_pins[] = { ArduinoDigital<I>::undefined ? nullptr : &ArduinoDigital<I>::instance...  };
    };
}
*/

}
}

#if defined( ARDUINO_PRO_MINI3_3V ) || defined( ARDUINO_PRO_MINI5V )
#   include "arduino_pro_mini/digital_regs.hpp"
#endif


