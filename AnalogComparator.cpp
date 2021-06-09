#include <Arduino.h>
#include "include/avr/pushbits.hpp"
#include "include/avr/AnalogComparator.hpp" 

using namespace levitator::avr;
//void (*AnalogComparator::chain_handler)() = nullptr;

AnalogComparator::AnalogComparator():
    status(ACSR, ACO){    
}

//void AnalogComparator::__vector_interrupt_handler(){
