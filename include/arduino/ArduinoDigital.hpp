#pragma once

#include "../util/meta.hpp"
#include "../avr/Digital.hpp"

//
// The main header to import digital I/O definitions for an Arduino
// Currently only the Pro Mini/atmega328p is defined, but it shouldn't be too hard to add more
//

#if defined( ARDUINO_PRO_MINI3_3V ) || defined( ARDUINO_PRO_MINI5V )
#   include "arduino_pro_mini/digital_regs.hpp"
#endif

namespace levitator{
namespace arduino{   

template<int I>
using ArduinoDigital = avr::Digital<DigitalPinRegs<I>>;
    
    
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
