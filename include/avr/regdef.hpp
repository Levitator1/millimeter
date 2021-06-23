#pragma once
#include "../util/util.hpp"
#include "../util/meta.hpp"
#include "avr_types.hpp"

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

//Statically-stored bit number
 template<bit_number BitNo>
 using sbitno = util::storage<bit_number, util::static_const_storage_tag<bit_number, BitNo>>;
 
 template<class RegType, regval<RegType> BitMask>
 using sbitmask = util::storage<regval<RegType>, util::static_const_storage_tag<regval<RegType>, BitMask>>;

template<class Reg, typename BitNoType>
struct bitno_2_mask{
    using reg_type = Reg;
    using bitno_type = BitNoType;
    using mask_type = util::integer_typeof<reg_type>;
    
    static mask_type convert(bitno_type bit){
        return _BV(bit);
    }    
};

template<class Reg, bit_number BitNo>
struct bitno_2_mask<Reg, sbitno<BitNo>>{
    using reg_type = Reg;
    using bitno_type = sbitno<BitNo>;
    using mask_type = sbitmask<reg_type, _BV(BitNo)>;
    
    static constexpr mask_type convert(bitno_type bit){
        return {};
    }    
};
 
/*
 template<class Reg, typename BitNoType>
 inline regval<Reg> bitno_2_mask(const Reg *, const BitNoType *p){
     return _BV(*p);
 }

 template<class Reg, bit_number BitNumber>
 inline constexpr regval<Reg> bitno_2_mask(const Reg *, const sbitno<BitNumber> *p){
     return _BV(BitNumber);
 }
 
 template<class Reg, typename BitNumberType>
 using bitno_2_mask_type = decltype( bitno_2_mask((const Reg *)nullptr, (const BitNumberType *)nullptr) );
 */

//Time 4 hax
//So, the AVR headers define each and every one of the registers as the dereference
//of the cast of a constant integer address to a pointer to volatile.
//The problem with this is that you can't specify a reference as a template parameter.
//Ok, so how about a pointer to the value of the register macro? No, that doesn't work
//because the compiler complains that it's not a pointer to a variable. Who cares?
//It's known at compile-time, so it should work. Well, it doesn't. However, what we can do
//is cast the register pointer back to an integral constant, and that is the original kind of thing
//that was ever permitted to be passed as a template value-parameter, and it works. So, here
//we will wrap an integer address with a class which we can pass as a template parameter, and
//which serves as an interface to the register.

template<typename T>
T &regaddr_deref(size_t addr){
    return *reinterpret_cast<typename cpp::remove_reference<T>::type *>(addr);
}

//Demand a specific atomic guard for all register operations
template<typename T, typename Guard>
struct atomic_guard_policy_require{
    using guard_type = Guard;
};

//Use a certain guard unless the register is single-byte, then use a null guard
//because the word length is 8-bits and that's inherently atomic with respect to interrupts.
//By default, we assume non-ISR-space operation only, but otherwise use atomic_guard_restore.
template<typename T, typename Guard>
struct atomic_guard_policy_as_needed{
    using guard_type = typename cpp::conditional< sizeof( util::integer_typeof<T> ) == 1,  util::null_type, Guard>::type;
};

template<typename T>
using default_atomic_guard_policy = atomic_guard_policy_as_needed<T, atomic_guard_restore>;

//template<typename T>
//struct default_reg_guard{
//    using guard_type = typename cpp::conditional< sizeof(T) == 1,  util::null_type, atomic_guard>::type;
//    using restore_guard_type = typename cpp::conditional< sizeof(T) == 1,  util::null_type, atomic_guard_restore>::type;
//};        

//StorageTag determines whether this register interface is allocated statically,
//where all instances are empty and point to the same register, or dynamically,
//where each instance can be populated individually to point to a different destination
template<typename T, class Guard, class StorageTag>
struct regaddr{    

public:
    //These two are subtly different, because dest_type is a memory-mapped register as a reference to volatile
    //And value_type is the value which you would retrieve or store from that location,
    //which is the same as the former, but with reference and volatile removed.
    using dest_type = T; //The type of a reference to the register as it is mapped into memory (u8 or u16)
    using value_type = regval<T>; //The value which passes in or out of the register

    using regptr_type = regptr<T>;
    using regptr_storage_type = util::storage<size_t, StorageTag>;        
    using guard_type = Guard;
    using storage_tag = StorageTag;                        

    regptr_storage_type register_pointer;

private:
    dest_type ref() const{
        return *reinterpret_cast<regptr_type>( register_pointer.get() );
    }                

public:
    regaddr(){}

    regaddr(regptr_type ptr):
        register_pointer(ptr){}

    value_type get() const{
        guard_type guard;
        return ref();
    }
    
    void set(value_type v){
        guard_type guard;
        ref() = v;
    }
    
    const regptr_storage_type &address() const{
        return register_pointer;
    }
    
    /*
    size_t address() const{
        return reinterpret_cast<size_t>(&ref());
    }
    */
    
    regaddr &operator=(value_type v){
        set(v);
        return *this;
    }

    regaddr &operator|=(value_type rhs){
        guard_type guard;
        ref() |= rhs;
        return *this;
    }

    regaddr &operator&=(value_type rhs){
        guard_type guard;
        ref() &= rhs;
        return *this;
    }

    regaddr &operator++(){
        guard_type guard;
        ++ref();
        return *this;
    }

    regaddr &operator--(){
        guard_type guard;
        --ref();
        return *this;
    }

    operator value_type() const{
        return get();
    }        
};

//static equality
template<typename T, class GuardPolicyL, size_t AddressL, class GuardPolicyR, size_t AddressR>
constexpr bool registers_are_same( const regaddr<T, GuardPolicyL, util::static_const_storage_tag<size_t, AddressL>> *lhs = nullptr,
    const regaddr<T, GuardPolicyR, util::static_const_storage_tag<size_t, AddressR>> *rhs = nullptr){
    
    using LT = typename cpp::remove_pointer< decltype(lhs) >::type;
    using RT = typename cpp::remove_pointer< decltype(rhs) >::type;
        
    //In order to match, the addresses must be the same, the guard types must be the same, and the register type must match
    return AddressL == AddressR && cpp::is_same<typename LT::guard_type, typename RT::guard_type>::value;
}

//Static inequality if types mismatch
template<typename Tl, class GuardPolicyL, class StorageL, typename Tr, typename GuardPolicyR, class StorageR>
constexpr bool registers_are_same( const regaddr<Tl, GuardPolicyL, StorageL> *lhs = nullptr,
    const regaddr<Tr, GuardPolicyR, StorageR> *rhs = nullptr){
    
    return false; //False if Tl and Tr differ
}

//Dynamic equality if types match
template<typename T, class GuardPolicyL, class StorageL, typename GuardPolicyR, class StorageR>
constexpr bool registers_are_same( const regaddr<T, GuardPolicyL, StorageL> *lhs,
    const regaddr<T, GuardPolicyR, StorageR> *rhs){
    
    using LT = typename cpp::remove_pointer< decltype(lhs) >::type;
    using RT = typename cpp::remove_pointer< decltype(rhs) >::type;
    
    return cpp::is_same<typename LT::guard_type, typename RT::guard_type>::value && &lhs->ref() == &rhs->ref();
}

//Naked scalar register references. We assume a register always has to be volatile.
template<typename T>
constexpr bool registers_are_same( const volatile T *lhs, const volatile T *rhs ){
    return &lhs == &rhs;
}

//Many variations on in-class attempts at this fail, producing a reference to address 0, but oddly, this works
//template<typename T, size_t Address, class Guard, class StorageTag>
//typename sregaddr<T, Address, Guard, StorageTag>::storage_type sregaddr<T, Address, Guard, StorageTag>::reg = *reinterpret_cast<typename cpp::remove_reference<T>::type *>(Address);

//template<typename T, size_t Address>
//typename sregaddr<T, Address>::dest_pointer_type sregaddr<T, Address>::reg = reinterpret_cast<typename cpp::remove_reference<T>::type *>(Address);

template<size_t Address, template<typename> class GuardPolicy = default_atomic_guard_policy>
using sreg8addr = regaddr<ioreg8, typename GuardPolicy<ioreg8>::guard_type, util::static_const_storage_tag<size_t, Address>>;

template<size_t Address, template<typename> class GuardPolicy = default_atomic_guard_policy>
using sreg16addr = regaddr<ioreg16, typename GuardPolicy<ioreg16>::guard_type, util::static_const_storage_tag<size_t, Address>>;

template<template<typename> class GuardPolicy = default_atomic_guard_policy>
using dreg8addr = regaddr<ioreg8, typename GuardPolicy<ioreg8>::guard_type, util::dynamic_storage_tag>;

template<template<typename> class GuardPolicy = default_atomic_guard_policy>
using dreg16addr = regaddr<ioreg16, typename GuardPolicy<ioreg16>::guard_type, util::dynamic_storage_tag>;

template<bit_number... No>
using bitlist = meta::values<bit_number, No...>;

//TODO: Can this be made to infer the register width? Right now you have to specify 8 or 16 bits.
//It's a pain, because you're dealing with integer addresses instead of pointers which normally convey that type information
#define REGADDR_NUMBER(x) ( reinterpret_cast<size_t>( &x ) )
//These macros allow you to do something like: my_template<SREG8ADDR(TIFR0)>
#define SREG8ADDR(x) levitator::avr::sreg8addr< REGADDR_NUMBER(x) >
#define SREG16ADDR(x) levitator::avr::sreg16addr< REGADDR_NUMBER(x) >
#define DREG8ADDR(x) levitator::avr::dreg8addr< REGADDR_NUMBER(x) >
#define DREG16ADDR(x) levitator::avr::dreg16addr< REGADDR_NUMBER(x) >

#define SREGADDR(x) levitator::avr::regaddr<decltype(x), typename levitator::avr::default_atomic_guard_policy<decltype(x)>::guard_type, levitator::util::dynamic_storage_tag>

}
}