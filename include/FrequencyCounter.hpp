#pragma once

#include "avr/atomic.hpp"
#include "util/tuple.hpp"
#include "avr/HWTimerCommon.hpp"

namespace levitator{
namespace avr{

template<typename TimerType, class InterruptGuard>
class FrequencyCounter;

template<class Regs, class InterruptGuard>
class FrequencyCounter< TimerBase<Regs>, InterruptGuard > {

public:
    using timer_base_type = TimerBase<Regs>;
    using time_type = typename timer_base_type::time_type;
    using interrupt_guard_type = InterruptGuard;
    using result_type = util::tuple<time_type, uint>;

private:
    const timer_base_type &m_timer;
    typename timer_base_type::time_type m_start_t;
    volatile uint m_events;

public:
    FrequencyCounter(const timer_base_type &timer):
        m_timer(timer){}

    
    inline time_type start(){
        {
            interrupt_guard_type guard;
            util::null_function(guard);
            m_events = 0;
        }
        return m_start_t = m_timer.ticks();
    }    

    inline uint events() const{
        interrupt_guard_type guard;
        util::null_function(guard);
        return m_events;
    }

    inline result_type result() const{
        interrupt_guard_type guard;
        util::null_function(guard);

        auto t = m_timer.ticks();
        return {t, m_events};
    }

    //Call this to bump the event count
    inline void callback(){
        interrupt_guard_type guard;
        util::null_function(guard);
        ++m_events;
    }

};

}
}

