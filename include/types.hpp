#pragma once
#include <stdint.h>
#include <Arduino.h>
#include "avr/HWTimerCommon.hpp"

namespace levitator{

using time_type = avr::TimerBase::time_type;
    
//shorthand
using uint = unsigned int;
using ulong = unsigned long;
    
using const_string = const char *;
using real = double;
using ad_sample = uint16_t;
using pin_id = uint8_t;
using pin_mode = uint8_t;
using pin_state = uint8_t;
//using microseconds = decltype(micros());
//using microseconds = unsigned long;

}

