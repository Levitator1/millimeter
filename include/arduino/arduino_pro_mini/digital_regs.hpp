#pragma once
#include "../../avr/Digital.hpp"
#include "../ArduinoDigital.hpp"
#include "avr/regdef.hpp"

namespace levitator{
namespace arduino{

//On the Arduino Pro Mini with atmega328p
//14 digital GPIOs, numbered 0-13
//Some of these can be configured for alternate functions
//such as serial or SPI IO
DEFINE_DIGITAL_PIN_REGS(0,  D, 0);
DEFINE_DIGITAL_PIN_REGS(1,  D, 1);
DEFINE_DIGITAL_PIN_REGS(2,  D, 2);
DEFINE_DIGITAL_PIN_REGS(3,  D, 3);
DEFINE_DIGITAL_PIN_REGS(4,  D, 4);
DEFINE_DIGITAL_PIN_REGS(5,  D, 5);
DEFINE_DIGITAL_PIN_REGS(6,  D, 6);
DEFINE_DIGITAL_PIN_REGS(7,  D, 7);
DEFINE_DIGITAL_PIN_REGS(8,  B, 0);
DEFINE_DIGITAL_PIN_REGS(9,  B, 1);
DEFINE_DIGITAL_PIN_REGS(10, B, 2);
DEFINE_DIGITAL_PIN_REGS(11, B, 3);
DEFINE_DIGITAL_PIN_REGS(12, B, 4);
DEFINE_DIGITAL_PIN_REGS(13, B, 5);

  
struct DeviceGPIOInfo{
    static constexpr int pin_begin=0, pin_end=14; //Pins go from 0 through 13, 14 is plus one in the usual C++ range style
};
        
}
}