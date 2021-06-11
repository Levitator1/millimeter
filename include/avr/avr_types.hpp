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
    
    template<typename T>
    using regptr = typename cpp::remove_reference<T>::type *;
    
    using ioreg8 = decltype(PORTB);

    //The value contained in an 8-bit io register    
    using regval8 = regval<ioreg8>;
    
    //Rare 16-bit registers
    using ioreg16 = decltype(TCNT1);
    using regval16 = regval<ioreg16>;
    
    using real = double;
    
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
    
    //Static version
    template<typename T, size_t Address>
    struct sregaddr{
        using value_type = T;
        using const_value_type = const T;
        static constexpr size_t address = Address;
        //satic constexpr value_type &value = regaddr_deref<T>(Address);
        static value_type &value;
        
        value_type &get(){
            return value;
        }
        
        const_value_type &get() const{
            return value;
        }
        
        inline sregaddr &operator=(regval<T> v){
            value = v;
            return *this;
        }
        
        inline operator value_type &(){
            return value;
        }
        
        inline operator value_type &() const{
            return value;
        }
    };
    
    template<typename T, size_t Address>
    typename sregaddr<T, Address>::value_type &sregaddr<T, Address>::value = *reinterpret_cast<typename cpp::remove_reference<T>::type *>(Address);
    
    template<size_t Address>
    struct sreg8addr: public sregaddr<ioreg8, Address>{
        using base_type = sregaddr<ioreg8, Address>;
        
        inline sreg8addr &operator=( regval<ioreg8> v ){
            base_type::operator=(v);
            return *this;
        }
    };
    
    template<size_t Address>
    struct sreg16addr: public sregaddr<ioreg16, Address>{
        using base_type = sregaddr<ioreg16, Address>;
        
        inline sreg16addr &operator=( regval<ioreg16> v ){
            base_type::operator=(v);
            return *this;
        }
    };
    
    //Dynamic
    template<typename T>
    struct dregaddr{
        using value_type = T;
        const size_t address;
        value_type &value;
        
        dregaddr(size_t addr):
            address(addr),
            value( regaddr_deref<T>(addr)  ){}
        
        dregaddr &operator=(regval<T> v){
            value = v;
            return *this;
        }
        
        inline operator value_type &(){
            return value;
        }
        
        inline operator value_type &() const{
            return value;
        }        
    };
    
    struct dreg8addr:public dregaddr<ioreg8>{
        using dregaddr<ioreg8>::dregaddr;
    };
    
    struct dreg16addr:public dregaddr<ioreg16>{
        using dregaddr<ioreg16>::dregaddr;
    };
    
    //Map an integer to a type.
    //This is useful and, indeed needed in order to pass large numbers of arguments
    //to a template. This way, you can wrap them all up in one container. If you don't
    //do that, then when you go initialize statics, you have to re-specify the
    //template argument list for each and every static, and that's insane.
    //Tag is used to distinguish the maps from each other, and then the
    //Index is used to select a stored type
    
    
}
}

#define REGADDR_NUMBER(x) ( reinterpret_cast<size_t>( &x ) )

//These macros allow you to do something like: my_template<SREG8ADDR(TIFR0)>
#define SREG8ADDR(x) levitator::avr::sreg8addr< REGADDR_NUMBER(x) >
#define SREG16ADDR(x) levitator::avr::sreg16addr< REGADDR_NUMBER(x) >

