#pragma once
#include <stdint.h>
#include "avr/avr_types.hpp"
#include "util/String.hpp"

namespace levitator{

using time_type = uint32_t;
    
//shorthand
using uint = unsigned int;
using ulong = unsigned long;
using String = util::String<>;
    
using const_string = const char *;
using real = double;
using ad_sample = uint16_t;
using pin_id = uint8_t;
using pin_mode = uint8_t;
using pin_state = uint8_t;

//using microseconds = decltype(micros());
//using microseconds = unsigned long;

}

//This helps silence some warnings under GNU compilers, and omitting it
//should present no other detriment
#ifdef __GNUC__
#   define NONNULL(...) __attribute__((nonnull (__VA_ARGS__)))
#else
#   define NONNULL(...)
#endif
