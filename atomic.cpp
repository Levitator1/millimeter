#include "include/avr/atomic.hpp"

using namespace levitator::avr;

atomic_guard::atomic_guard(){
    cli();
}

atomic_guard::~atomic_guard(){
    sei();
}

atomic_guard_restore::atomic_guard_restore():
    m_was_on( SREG & _BV(SREG_I)  ){
    cli();
}

atomic_guard_restore::~atomic_guard_restore(){
    if(m_was_on)
        sei();
}