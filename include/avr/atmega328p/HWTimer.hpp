#pragma once
#include "avr/avr_types.hpp"
#include "util/meta.hpp"
#include "../HWTimerCommon.hpp"

namespace levitator{
namespace avr{

using Timer0RegList =  meta::types< 
        TCNT0, TCCR0A,
        TCCR0B, TIMSK0, TIFR0,
        OCR0A, OCR0B >;

using Timer1RegList = meta::types< ICR1, 
        TCNT1, TCCR1A,
        TCCR1B, TIMSK1, TIFR1,
        OCR1A, OCR1B >;

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
