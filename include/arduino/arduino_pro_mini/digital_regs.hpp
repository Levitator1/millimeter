#pragma once
#include "../../avr/Digital.hpp"

namespace levitator{
namespace arduino{

//On the Arduino Pro Mini with atmega328p
//8 digital GPIOs, numbered 2-10
DEFINE_DIGITAL_PIN_REGS(2, D,2);
DEFINE_DIGITAL_PIN_REGS(3, D,3);
DEFINE_DIGITAL_PIN_REGS(4, D,4);
DEFINE_DIGITAL_PIN_REGS(5, D,5);
DEFINE_DIGITAL_PIN_REGS(6, D,6);
DEFINE_DIGITAL_PIN_REGS(7, D,7);
DEFINE_DIGITAL_PIN_REGS(8, B,0);
DEFINE_DIGITAL_PIN_REGS(9, B,1);
DEFINE_DIGITAL_PIN_REGS(10,B,2);

struct DeviceGPIOInfo{
    static constexpr int pin_begin=2, pin_end=11; //Pins go from 2 through 10, 11 is plus one in the usual C++ range style
};
        
}
}