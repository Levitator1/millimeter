#pragma once

#include <avr/io.h>
#include "avr_types.hpp"
#include "../util/util.hpp"
#include "device_property.hpp"
#include "pushbits.hpp"

/*
* Hardware timer stuff
*
* It's hoped that this isn't device-specific, but it's not made clear whether there is any
* attempt made at consistency between instances of peripherals on the same microcontroller,
* let alone standardization across microcontrollers. So, we attempt to define timers in a general
* way here, and then we add folders to properly configure the classes for devices on a specific
* MCU.
*/

//A type named levitator::avr::Config must be defined (or aliased) before including this header
//It must define static system_clock as the clock rate in Hz

namespace levitator{
namespace avr{

    struct TimerRegisters{
    ioreg8
        &tccrXa, //control register a
        &tccrXb, //control register b
        //&tccrXc, //control register c     
        &timskX, //interrupt mask register
        &tifrX;

        bit_number toie_bit, tov_bit;
    
    //We disregard control register C as it is not present in all timers
    //and it's some obscure thing with two bits pertaining to waveform comparison
};

struct TimerRegisters8 : public TimerRegisters{

    ioreg8 &tcntX; //Counter register
    TimerRegisters8( TimerRegisters &&regs, ioreg8 &tcntX_arg );
};

//We assume that capture capability is common to the 16-bit registers.
//If it's not, we can stick the implementation in a mixin and inherit from it
//with virtually.
struct TimerRegisters16 : public TimerRegisters{
    ioreg16 
        &tcntX, //Counter register
        &icr,   //capture register
        &ocrXa, //Comparison register a
        &ocrXb; //Comparison register b
    
    //Bit numbers
    bit_number icie_bit, icf_bit, toie_bit; //Capture interrupt enable bit

    TimerRegisters16( TimerRegisters &&regs, ioreg16 &tcntX_arg, const ioreg16 &icr_arg, 
        ioreg16 ocrXa_arg, ioreg16 ocrXb_arg, bit_number icie, bit_number icf, bit_number toie );
};

//Hardware timer. The Arduino libs do this more abstractly, but here we ensure, at least, that
//we are addressing the specific hardware timer we want because some have unique abilities.

//Try to handle common timer capabilities. A typical AVR seems to have at least two,
//one 8-bit and another 16-bit.

//TODO: This is written for the 16-bit Timer/Counter 1, so make sure it's compatible with #0, as well
class TimerBase{    
public:
    using time_type = unsigned long;  
    time_type ticks_hi_bits = 0;
    
private:
    TimerRegisters &m_regs;
    
    //Pushes a bunch of stuff onto the stack and mostly clears it, where the Arduino runtime
    //has mucked with it and made it all weird. Notably, it sets the counter multiplier to zero
    //and it turns off PWM mode, and it enables the full range of the count register (rather than being capped at 0xFF)
    //The noise canceler is turned off, too. Probably not safe to expect the Arduino runtime to keep time correctly having upended
    //all its counter and timer settings. But, hey, you've got direct control of the hardware instead.
    pushbits<ioreg8> m_clear_tccrxa, m_clear_tccrxb;

protected:
    template<typename T>
    inline time_type merge_tick_bits( T low_bits ) const{
        unsigned long result = (((time_type)ticks_hi_bits) << (sizeof(low_bits) * avr::bits_per_byte)) | low_bits;
        return result;
    }
    
public:          
    volatile bit_property<ioreg8> overflow_interrupt_enable,
        overflow_flag;    
    
    TimerBase(TimerRegisters &m_regs);

    inline TimerRegisters &registers(){
        return m_regs;
    }                        
};

class Timer8:public TimerBase{
protected:
    inline TimerRegisters8 &registers(){
        return static_cast<TimerRegisters8 &>( TimerBase::registers() );
    }

public:
    using value_type = uint8_t;
    Timer8(TimerRegisters8 &m_regs);
    register_property<ioreg8> counter;

    inline time_type ticks() const{
        return merge_tick_bits(counter);
    }

};

class Timer16:public TimerBase{
    inline TimerRegisters16 &registers(){
        return static_cast<TimerRegisters16 &>( TimerBase::registers() );
    }

public:
    using value_type = uint16_t;
    Timer16(TimerRegisters16 &regs);
    register_property<ioreg16> 
        counter,
        capture,
        comparison_register_a,
        comparison_register_b;
    
    bit_property<ioreg8>         
        capture_interrupt_enable,        
        capture_flag;
    
    inline time_type ticks() const{
        return merge_tick_bits(counter);
    }
            
    //Clears the capture flag, re-enabling the capture register for the next event
    inline time_type capture_ticks(){
        auto cap = capture.get();
        capture_flag = false;
        return merge_tick_bits<uint16_t>(cap);
    }
    
    //  inline value_type read() const{
    //        return registers().tcntX;
    //}
};

}
}