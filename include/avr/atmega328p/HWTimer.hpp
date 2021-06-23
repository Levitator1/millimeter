#pragma once
#include "avr/avr_types.hpp"
#include "util/meta.hpp"
#include "../HWTimerCommon.hpp"

namespace levitator{
namespace avr{

using Timer1RegList = meta::types< SREGADDR(ICR1), 
        SREGADDR(TCNT1), SREGADDR(TCCR1A),
        SREGADDR(TCCR1B), SREGADDR(TIMSK1), SREGADDR(TIFR1),
        SREGADDR(OCR1A), SREGADDR(OCR1B) >;

using Timer1BitList = avr::bitlist<ICIE1, TOIE1, ICF1,
            TOIE1, TOV1>;
    
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
