#pragma once
#include "../util/util.hpp"
#include "avr_types.hpp"
#include "atomic.hpp"

/*
*
* Simple RAII way to atomically set or atomically unset some bits in an IO register,
* and then to atomically restore them on cleanup
*
*/

namespace levitator{
namespace avr{

namespace impl{

    //We will typically be storing to a volatile register, but the decay of that type
    //is a plain old non-cv value and that is what we want to pass around except
    //when actually addressing the register
    template<typename T>
    using pushbits_value_type = typename util::decay<T>::type;

    template<typename T, class Traits>
    class pushbits_impl{
    public:
        using value_type = pushbits_value_type<T>;

    private:
        T &m_target;                        //Reference to target register
        value_type m_old;                   //Backup of original register value
        const value_type m_changebits;      //Set of bits which were altered (cleared, set, etc.) and need restored

    public:
        using dest_type = T;        

        pushbits_impl( T &target, value_type bits):
            m_target(target),
            m_changebits(bits){
                Traits::init_func( target, bits, m_old );
        }

        ~pushbits_impl(){
            Traits::restore_func( m_target, m_changebits, m_old );
        }
    };


    //
    // These bitwise &= and |= operators are explicitly defined in the atmega328p manual as to emit atomic instructions 
    // so, these are marked simple as there are no special measures for atomicity. Not sure if that applies to 16-bit registers.
    // They might require extra effort to handle both bytes atomically.
    //
    template<typename T>
    struct pushbits_set_traits_simple{                
        static void init_func(T &target, const pushbits_value_type<T> &bits, pushbits_value_type<T> &old){
            old = target;
            target |= bits;
        }

        static void restore_func(T &target, const pushbits_value_type<T> &bits, pushbits_value_type<T> &old){
            target &= ~( ~old & bits );
        }
    };

    template<typename T>
    struct pushbits_clear_traits_simple{       
        static void init_func(T &target, const pushbits_value_type<T> &bits, pushbits_value_type<T> &old){
            old = target;
            target &= ~bits;
        }
        
        static void restore_func(T &target, const pushbits_value_type<T> &bits, pushbits_value_type<T> &old){
            target |= bits & old;  
        }
    };
    
    template<typename T>
    struct pushbits_traits_simple{
        static void init_func(T &target, const pushbits_value_type<T> &bits, pushbits_value_type<T> &old){
            old = target;
        }
        
        static void restore_func(T &target, const pushbits_value_type<T> &bits, pushbits_value_type<T> &old){
            pushbits_set_traits_simple<T>::restore_func(target, bits, old);
            pushbits_clear_traits_simple<T>::restore_func(target, bits, old);
        }        
    };
    
    using pushbits_set_ioreg8_impl = impl::pushbits_impl<ioreg8, impl::pushbits_set_traits_simple<ioreg8>>;    
    using pushbits_clear_ioreg8_impl = impl::pushbits_impl<ioreg8, impl::pushbits_clear_traits_simple<ioreg8>>;
    using pushbits_ioreg8_impl = impl::pushbits_impl<ioreg8, impl::pushbits_traits_simple<ioreg8>>;
}

template<typename T>
class pushbits;

template<>
class pushbits<ioreg8>:public impl::pushbits_ioreg8_impl{
    using impl::pushbits_ioreg8_impl::pushbits_ioreg8_impl;
};

template<typename T>
class pushbits_set;

template<typename T>
class pushbits_clear;

//Should work for 8-bit registers. 16-bit registers have a bunch of atomicity caveats
//but need to look into that further.
template<>
class pushbits_set<ioreg8>:public impl::pushbits_set_ioreg8_impl{
public:
    using impl::pushbits_set_ioreg8_impl::pushbits_set_ioreg8_impl;
};

template<>
class pushbits_clear<ioreg8>:public impl::pushbits_clear_ioreg8_impl{
public:
    using impl::pushbits_clear_ioreg8_impl::pushbits_clear_ioreg8_impl;
    pusbits_clear(ioreg8 &);
};

}
}