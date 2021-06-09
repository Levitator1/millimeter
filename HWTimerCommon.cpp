#include "include/avr/HWTimerCommon.hpp"

using namespace levitator::avr;

TimerBase::TimerBase(TimerRegisters &regs):
    m_regs(regs),
    m_clear_tccrxa{regs.tccrXa, 0xff},
    m_clear_tccrxb{regs.tccrXb, 0xff},
    overflow_interrupt_enable{regs.timskX, regs.toie_bit},
    overflow_flag{ regs.tifrX, regs.tov_bit }{
                
        //Set the counter multiplier to 1
        m_regs.tccrXb = 1;                
}

TimerRegisters8::TimerRegisters8( TimerRegisters &&regs, ioreg8 &tcntX_arg):
        TimerRegisters(util::move(regs)),
        tcntX(tcntX_arg){}

TimerRegisters16::TimerRegisters16( TimerRegisters &&regs, ioreg16 &tcntX_arg, const ioreg16 &icr_arg,
        ioreg16 &ocrXa_arg, ioreg16 &ocrXb_arg, bit_number icie, bit_number icf, bit_number toie):
        TimerRegisters(util::move(regs)),        
        tcntX(tcntX_arg),
        icr(icr_arg),
        ocrXa(ocrXa_arg),
        ocrXb(ocrXb_arg),
        icie_bit(icie),
        icf_bit(icf),
        toie_bit(toie){}

Timer8::Timer8(TimerRegisters8 &regs):
    TimerBase(regs),
    counter(regs.tcntX){}

Timer16::Timer16(TimerRegisters16 &regs):
    TimerBase(regs),
    counter(regs.tcntX),
    capture(regs.icr),
    comparison_register_a(regs.ocrXa),
    comparison_register_b(regs.ocrXb),    
    capture_interrupt_enable(regs.timskX, regs.icie_bit),    
    capture_flag(regs.tifrX, regs.icf_bit){}

