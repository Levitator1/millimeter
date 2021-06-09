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
    
    //Address of an I/O port (add 0x20 to get memory-mapped equivalent)
    using io_address = uint8_t;
    
    using bit_number = uint8_t;
    
    template<typename T>
    using regval = typename cpp::decay<T>::type;
    
    using ioreg8 = decltype(PORTB);

    //The value contained in an 8-bit io register    
    using regval8 = regval<ioreg8>;
    
    //Rare 16-bit registers
    using ioreg16 = decltype(TCNT1);
    using regval16 = regval<ioreg16>;
    
    using real = double;
}
}