#pragma once
#include "avr/avr_types.hpp"
#include "util/meta.hpp"
#include "../HWTimerCommon.hpp"
#include "../regdef.hpp"

namespace levitator{
namespace avr{

using Timer0RegList =  meta::types< 
        TCNT0, TCCR0A,
        TCCR0B, TIMSK0, TIFR0,
        OCR0A, OCR0B>;

using Timer0BitList = meta::types<sbitno<TOIE1>, sbitno<TOV1>>;

using Timer1RegList = meta::types< ICR1, 
        TCNT1, TCCR1A,
        TCCR1B, TIMSK1, TIFR1,
        OCR1A, OCR1B >;

using Timer1BitList = meta::types<sbitno<ICIE1>, sbitno<TOIE1>, sbitno<ICF1>,
            sbitno<TOIE1>, sbitno<TOV1>>;
    

//8-bit Timer/Counter 0 on the atmega328p, and maybe other devices
struct Timer0Registers:public TimerRegs<Timer0RegList, Timer0BitList>{
};

//16-bit Timer/Counter 1 on the atmega328p, and maybe other devices
struct Timer1Registers:public CapturableTimerRegs<Timer1RegList, Timer1BitList>{
};

class HWTimer0 : public TimerBase<Timer0Registers>{
public:
    static HWTimer0 &instance();
};

class HWTimer1 : public CapturableTimer<Timer1Registers>{    
    
public:
    static HWTimer1 &instance();        
};
  
extern HWTimer0 &hwtimer0;
extern HWTimer1 &hwtimer1;

}
}
