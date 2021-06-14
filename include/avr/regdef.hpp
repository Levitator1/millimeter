#pragma once
#include "../util/meta.hpp"

/*
 *
 * Utilities for defining and validating register and bit definitions
 * for MCU devices at compile-time
 * 
 */

namespace levitator{
namespace avr{

//statically assert that a list of registers and a list of bits are of their
//expected lengths
template<class RegList, class BitList, int RegsExpect, int BitsExpect>
struct assert_regs_count{
    static_assert( RegList::size == RegsExpect, "Register list length does not equal expected" );
    static_assert( BitList::size == BitsExpect, "Bit list length does not equal expected" );
};

//Use this type when declaring fields of a register definition struct to automatically declare the type of a register
//based on its specified definition at the i'th position in the register list.
//Considered verifying the underlying type of the register, but it seems pointless since you're going to get an error anyway
//for performing bitwise or numeric operations on an inappropriate type. Besides, if a register widens on later hardware, you can still
//potentially be backward-compatible referencing the narrow version of the register, as long as things stay little-endian.
template<class RegList, int I>
using regdecl = typename meta::type_i<RegList, I>;

template<class BitList, int I>
using bitdecl = typename meta::type_i<BitList, I>;

}
}