#pragma once

/*
*
* Take advantage of the analog comparator on some AVR devices, such as the atmega328p
* It will write a timestamp to a register when "comparator+" V exceeds "comparator-" V
* on the rising edge.
*
*/

#include "avr_types.hpp"
#include "pushbits.hpp"
#include "device_property.hpp"
#include "HWTimerCommon.hpp"
#include "../util/pushval.hpp"
#include "../Console.hpp"
#include "../util/pushval.hpp"

namespace levitator {
namespace avr {
    
class AnalogComparator{

    //As long as this object is live, hold ADC power management disabled
    //Otherwise, it can prevent stuff from working, or stretch the length of operations on resume
    pushbits_clear<PRR> m_power_bits = {PRR{}, _BV(PRADC)}; 
    pushbits_clear<ADCSRB> m_multiplexer_bits = {ADCSRB{}, _BV(ACME) };      //Not interested in fancy analog signal routing. Just AIN0 and AIN1.
    pushbits_clear<ACSR> m_comparator_bits_off = {ACSR{}, _BV(ACD)  | _BV(ACIE)    }; //We leave the interrupts alone in case someone else is using them
        //ACD off disabled power-cutoff to the comparator.
        //ACBG disables comparison to an internal reference voltage called the "bandgap voltage"
        //ACO disables mapping the compartor output to a bit in memory, which saves 2 clock cycles somewhere, maybe per state change?

    pushbits_set<TCCR1B>    m_tccr1b_bits_on = {TCCR1B{}, _BV(ICES1)};                  //Trigger on rising edge
    pushbits_set<ACSR>      m_comparator_bits_on = {ACSR{}, _BV(ACIC) | _BV(ACBG) };    //This actually turns on hardware timestamp collection
                                                                                        //Also select the bandgap voltage as reference

    
    //Timer overflow interrupt-handling
    //static void (*chain_handler)();    
    //static __attribute__((signal)) void __vector_interrupt_handler();
        
public:                
    AnalogComparator();
    
    //Debug
    //bit_property<static_bit_property_regs8<&ACSR, ACO>, util::null_type> status;            //Whether the comparator is currently triggered. 2 cycles to read?
        
    //Probably much faster and efficient to timeout based on poll attempts
    //rather than to read a clock and calculate proper time units
    #if false
    template<class Func>
    unsigned int collect_events(Timer16 &timer, unsigned long max_tries, uint n, const Func &func){
        
        //util::pushval<decltype(timer.capture_interrupt_enable)> restore_capture_enable{ timer.capture_interrupt_enable };
        //timer.capture_interrupt_enable = true;        
        //chain_handler =
        //auto max_low_ticks = typename decltype(timer.comparison_register_a)::value_type{0};
        
        //Something keeps setting this to 1, which caps the counter value at 0xFF,
        //among probably other things pertaining to PWM mode
        //TCCR1A = 1;
        OCR1A = 0xFFFF;
        OCR1B = 0xFFFF;
        
        //Not sure why this doesn't work. It's normal mode with a multiplier of 1
        //TCCR1A = 0;
        //TCCR1B = 1;  //Set the counter multiplier to 1
        
        //Nope
        //TCCR1A = 0;
        //TCCR1B = 4;
        
        //Does not trigger overflow flag
        //TCCR1A = 3;
        //TCCR1B = 1;
        //TCCR1B |= 128; //Noise filter
        
        //Nope
        //TCCR1A = 0;
        //TCCR1B = 5 | 128;
        
        //Advances, but capture triggers every 38 cycles
        //TCCR1A = 0;
        //TCCR1B = 9 | 128;
        
        //DEBUG
        TCCR1A = 0;
        TCCR1B = 1 | 64; //1x clock multiplier, high-edge trigger
        
        
        /*
        consolens::console.print("TCCR1A: ");
        consolens::console.println(TCCR1A, BIN);
        consolens::console.print("TCCR1B: ");
        consolens::console.println(TCCR1B, BIN);
        uint16_t max_low_ticks = 0xFFFF;
        timer.comparison_register_b.set(max_low_ticks);
        timer.comparison_register_a.set(max_low_ticks);
        
        consolens::console.print("Comparison A: ");
        consolens::console.println(timer.comparison_register_a, BIN);
        consolens::console.print("Comparison B: ");
        consolens::console.println(timer.comparison_register_b, BIN);
        
        consolens::console.print("Capture sizes: ");
        consolens::console.print( sizeof( timer.capture.get() ) );
        consolens::console.print("/");
        consolens::console.print( sizeof( typename decltype(timer.capture)::dest_type ) );
        */
        
        //We will do without interrupts because they have state saving/restoring overhead
        //And also, we need to make sure that if a capture occurs, the high bits don't
        //get bumped before we retrieve them to obtain the total time.
        //auto push_overflow_interrupts = util::make_pushval(timer.overflow_interrupt_enable);
        timer.overflow_interrupt_enable = false;
        
        auto push_capture_interrupts = util::make_pushval(timer.capture_interrupt_enable);
        timer.capture_interrupt_enable = false;
        
        
        timer.ticks_hi_bits = 0;        
        uint i = 0;
                
        timer.capture_flag = false;
        decltype(timer.capture_ticks()) capture;
        do{
            if(timer.capture_flag){
            //if(TIFR1 & _BV(ICF1)){ //DEBUG
            //if(ACSR & _BV(ACO)){
                capture = timer.capture_ticks();
                func(i, capture);
                ++i;         
                
                /*
                consolens::console.print("Sample #: ");
                consolens::console.print(i);
                consolens::console.print(", Ticks: ");
                consolens::console.println(capture);
                */
            }
                        
            //if(timer.overflow_flag){ 
            if(TIFR1 & _BV(TOV1)){ ////DEBUG
                ++timer.ticks_hi_bits;
                
                //DEBUG
                //timer.overflow_flag = false;
                TIFR1 &= ~_BV(TOV1);
            }
            
        }while( i < n && --max_tries > 0 );        
                
        return i;
    }
    #endif
};

}
}

