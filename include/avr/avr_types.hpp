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
    
    template<typename T>
    using regval = typename cpp::decay<T>::type;        
    
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
    
    //Statically-stored bit number
    template<bit_number BitNo>
    using sbitno = util::storage<bit_number, util::static_const_storage_tag<bit_number, BitNo>>;
    
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
}
}

#define REGADDR_NUMBER(x) ( reinterpret_cast<size_t>( &x ) )

//These macros allow you to do something like: my_template<SREG8ADDR(TIFR0)>
#define SREG8ADDR(x) levitator::avr::sreg8addr< REGADDR_NUMBER(x) >
#define SREG16ADDR(x) levitator::avr::sreg16addr< REGADDR_NUMBER(x) >

