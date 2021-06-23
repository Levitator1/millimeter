#pragma once
#include <stdint.h>
#include <avr/io.h>
#include "avr_types.hpp"
#include "avr/regdef.hpp"
#include "../util/util.hpp"
#include "../util/meta.hpp"
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
//It must define system_clock as the clock rate in Hz

namespace levitator{
namespace avr{

template<class RegList, class BitList>
struct TimerRegs{
private:
    assert_regs_count<RegList, BitList, 7, 2> verify_def_counts;

public:    
    template<int I>
    using regtype = regdecl<RegList, I>;
    
    template<int I>
    using bittype = bitdecl<BitList, I>;

    regtype<0> tcntX;
    regtype<1> tccrXa;
    regtype<2> tccrXb;
    regtype<3> timskX;
    regtype<4> tifrX;
    regtype<5> ocrXa;
    regtype<6> ocrXb;
    
    bittype<0> toie_bit;
    bittype<1> tov_bit;    
};

//Some timers (Timer1 on the atmega328p) support hardware data capture. They can write a timestamp to an IO
//register when triggered either by a digital comparators against the counter value, or by an analog comparator against
//two voltages.
template<class RegList, class BitList>
struct CapturableTimerRegs:public TimerRegs< typename meta::split_type_list<RegList,1>::right_list, typename meta::split_type_list<BitList,3>::right_list>{
    
    template<int I>
    using regtype = regdecl<RegList, I>;
    
    template<int I>
    using bittype = bitdecl<BitList, I>;
    
    regtype<0> icrX;        //capture register
    
    bittype<1> icieX_bit;   //capture interrupt enable in TIMSK
    bittype<2> toieX_bit;   //overflow interrupt enable in TIMSK
    bittype<3> icfX_bit;    //capture flag in TIFR
};

//Hardware timer. The Arduino libs do this more abstractly, but here we ensure, at least, that
//we are addressing the specific hardware timer we want because some have unique abilities.

//Try to handle common timer capabilities. A typical AVR seems to have at least two,
//one 8-bit and another 16-bit.

//TODO: This is written for the 16-bit Timer/Counter 1, so make sure it's compatible with #0, as well
    
template<typename Regs>
class TimerBase{    
public:
    using regs_type = Regs;
    using time_type = unsigned long;  
    volatile time_type ticks_hi_bits = 0;
    
private:
    regs_type m_regs;
        
    //Pushes a bunch of stuff onto the stack and mostly clears it, where the Arduino runtime
    //has mucked with it and made it all weird. Notably, it sets the counter multiplier to zero
    //and it turns off PWM mode, and it enables the full range of the count register (rather than being capped at 0xFF)
    //The noise canceler is turned off, too. Probably not safe to expect the Arduino runtime to keep time correctly having upended
    //all its counter and timer settings. But, hey, you've got direct control of the hardware instead.
    
    //Footnote: I've decided to develop under MPLAB because it knows how to build AVR binaries
    //which will run on an AVR Arduino without the Arduino libraries. So, some of this is probably redundant now.
    pushbits<ioreg8> m_clear_tccrxa, m_clear_tccrxb;

protected:
    //Takes T, shifts high bits left by the size of T, and then ors in the low bits
    template<typename T>
    inline time_type merge_tick_bits( T low_bits ) const{
        unsigned long result = (((time_type)ticks_hi_bits) << (sizeof(low_bits) * avr::bits_per_byte)) | low_bits;
        return result;
    }
    
public:          
    TimerBase(regs_type &regs):
        m_regs(regs),
        m_clear_tccrxa{regs.tccrXa, 0xff},
        m_clear_tccrxb{regs.tccrXb, 0xff},
        counter(regs.tcntX),
        comparator_a(regs.ocrXa),
        comparator_b(regs.ocrXb){
            
        //Set the counter multiplier to 1
        regs.tccrXb = 1;                
    }

    inline regs_type &registers(){
        return m_regs;
    }
    
    inline time_type ticks() const{
        return this->merge_tick_bits(util::integer_value(registers.tcntX)); //TODO: this will probably complain because it doesn't know to convert to integer
    }
    
    //Keep in mind that writing these at an inopportune time can lose a comparator event
    register_property<decltype(regs_type::tcntx)> counter;
    
    //On capture-capable timers, these can trigger a capture event and optionally an interrupt.
    //They can also be used for PWM generation.
    register_property<decltype(regs_type::ocrXa)> comparator_a;
    register_property<decltype(regs_type::ocrXb)> comparator_b;
};

template<typename Regs>
class CapturableTimer:public virtual TimerBase<Regs>{
    using base_type = TimerBase<Regs>;
public:
    using regs_type = typename base_type::regs_type;
    register_property<decltype(regs_type::icrX)> capture_value;
    CapturableTimer(Regs &regs);
    
    bit_property< decltype(Regs::timskX), decltype(Regs::toie_bit)> capture_interrupt_enable;
    bit_property< decltype(Regs::tifrX),  decltype(Regs::icfX_bit)> capture_flag;        
            
    //Clears the capture flag, re-enabling the capture register for the next event
    inline time_type capture_ticks(){
        auto cap = util::integer_value(capture_value); 
        
        //DEBUG        
        //cli();
        //auto cap = ICR1;
        //auto cap = TCNT1;
        //sei();
        
        //DEBUG
        //capture_flag = true;        //Cleared by reverse logic!
        //TIFR1 &= ~_BV(ICF1);
        //ACSR &= ~_BV(ACI);
        
        return base_type::merge_tick_bits(cap);
    }
};

template<typename Regs>
class Timer8:public virtual TimerBase<Regs>{
public:
    static_assert( sizeof( util::integer_value( *cpp::declptr<decltype(Timer8::counter)>() ) ) == 1, "Timer8 expects a single-byte counter" );    
};

template<typename Regs>
class Timer16:public TimerBase<Regs>{        
public:    
    static_assert( sizeof( util::integer_value( *cpp::declptr<decltype(Timer16::counter)>() ) ) == 2, "Timer16 expects a two-byte counter" );        
};

}
}