#pragma once

#include <avr/io.h>
#include <stdint.h>
#include "../util/cplusplus.hpp"
#include "../util/util.hpp"
#include "avr_types.hpp"
#include "atomic.hpp"

namespace levitator{
namespace avr{

    static constexpr int bits_per_byte = 8;
    
    //Shorthand
    using uint = unsigned int;
    using ulong = unsigned long;
    
    using time_type = ulong;
    
    //Address of an I/O port (add 0x20 to get memory-mapped equivalent)
    using io_address = uint8_t;    
    using bit_number = uint8_t;
    
    //Whatever the preferred conversion-to-integer is, that's what we decide is the
    //underlying data type of our register contents. So, this works whether scalar or wrapper types,
    //assuming the wrapper has a conversion-to-integer operator defined, which it probably should.
    template<typename T>
    using regval = util::integer_typeof<T>;
    
    using ioreg8 = decltype(PORTB);
    //The value contained in an 8-bit io register    
    using regval8 = regval<ioreg8>;        
    using ioreg16 = decltype(TCNT1); //Rare 16-bit registers
    using regval16 = regval<ioreg16>;    
    using real = double;
    template<typename T>
    using regptr = typename cpp::remove_reference<T>::type *;
    using reg8ptr = regptr<ioreg8>;
    using reg16ptr = regptr<ioreg16>;
    
}
}