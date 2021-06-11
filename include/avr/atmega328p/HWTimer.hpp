#pragma once
#include "../HWTimerCommon.hpp"

namespace levitator{
namespace avr{

/*
//8-bit Timer/Counter 0 on the atmega328p, and maybe other devices
struct Timer0Registers:public TimerRegisters8{
    Timer0Registers();
};

//16-bit Timer/Counter 1 on the atmega328p, and maybe other devices
struct Timer1Registers:public TimerRegisters16{
    Timer1Registers();
};

class HWTimer0 : public Timer8{
    HWTimer0();
    
public:
    static HWTimer0 &instance();
};

class HWTimer1 : public Timer16{
    HWTimer1();
    
public:
    static HWTimer1 &instance();        
};
*/
  
//extern HWTimer0 &hwtimer0;
//extern HWTimer1 &hwtimer1;

}
}
