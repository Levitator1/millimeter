#include "include/avr/atmega328p/HWTimer.hpp"

using namespace levitator::avr;

/*
Timer0Registers::Timer0Registers():
    TimerRegisters8{ {TCCR0A, TCCR0B, TIMSK0, TIFR0, TOIE0, TOV0}, TCNT0 }{    
}

Timer1Registers::Timer1Registers():
    TimerRegisters16{ {TCCR1A, TCCR1B, TIMSK1, TIFR1, TOIE1, TOV1}, TCNT1, ICR1, OCR1A, OCR1B, ICIE1, ICF1, TOIE1 }{
}    

static Timer0Registers timer0_registers;
static Timer1Registers timer1_registers;

HWTimer0::HWTimer0():
    Timer8( timer0_registers ){}

HWTimer1::HWTimer1():
    Timer16( timer1_registers ){}
*/

/*
 * 
 * These are necessary because if the timers are initialized during global
 * static initialization, it can conflict or be overridden by the Arduino
 * runtime. So, call these from a main program after all of the other automatic
 * initialization has run.
 * 
 /
HWTimer0 &HWTimer0::instance(){
    static HWTimer0 timer;
    return timer;    
}

HWTimer1 &HWTimer1::instance(){
    static HWTimer1 timer;
    return timer;
    
}

//HWTimer0 HWTimer0::instance={};
//HWTimer0 &levitator::avr::hwtimer0 = HWTimer0::instance;

//HWTimer1 HWTimer1::instance={};
//HWTimer1 &levitator::avr::hwtimer1 = HWTimer1::instance;

//ISR( TIMER0_OVF_vect ){
//    ++hwtimer0::ticks_hi_bits;
//}

//Oddly, this ISR causes missing symbol __vector_16 when linking. Timer0
//will thus operate at an 8-bit resolution and immediately overflow without this

//ISR( TIMER0_OVF_vect ){
//    ++hwtimer0.ticks_hi_bits;
//}

//However, this works, which is good, because it's the timer I want atm
ISR( TIMER1_OVF_vect  ){
    ++HWTimer1::instance().ticks_hi_bits;
    //++hwtimer1.ticks_hi_bits;
}

*/