#pragma once

#include "atomic.hpp"

namespace levitator{
namespace avr{
 
namespace impl{
    
    template<typename Traits>
    class pushbits_impl;
    
    template<typename T>
    struct pushbits_traits_base{
        using ref_type = atomic_ref<T>; //We refer to each register via atomic to ensure atomicity
        using value_type = typename ref_type::value_type;   //The values we pass around
        using dest_type = typename ref_type::dest_type;     //The actual backing variable or register
    };
    
    template<typename T>
    struct pushbits_traits_clear:public pushbits_traits_base<T>{
        using base_type = pushbits_traits_base<T>;
        using ref_type = typename base_type::ref_type;
        using value_type = typename base_type::value_type;
        using dest_type = typename base_type::dest_type;
        using impl_type = pushbits_impl<pushbits_traits_clear>;
        
        static void init(ref_type &ref, value_type &old, const value_type &bits ){
            old = ref;
            ref &= ~bits;
        }
        
        static void restore(ref_type &ref, value_type &old, const value_type &bits){
            ref |= bits & old;
        }        
    };
    
    template<typename T>
    struct pushbits_traits_set:public pushbits_traits_base<T>{
        using base_type = pushbits_traits_base<T>;
        using ref_type = typename base_type::ref_type;
        using value_type = typename base_type::value_type;
        using dest_type = typename base_type::dest_type;
        using impl_type = pushbits_impl<pushbits_traits_set>;
        
        static void init(ref_type &ref, value_type &old, const value_type &bits ){
            old = ref;
            ref |= bits;
        }
        
        static void restore(ref_type &ref, value_type &old, const value_type &bits){
            ref &= ~(bits & ~old);
        }        
    };
    
    template<typename T>
    struct pushbits_traits:public pushbits_traits_base<T>{
        using base_type = pushbits_traits_base<T>;
        using ref_type = typename base_type::ref_type;
        using value_type = typename base_type::value_type;
        using dest_type = typename base_type::dest_type;
        using impl_type = pushbits_impl<pushbits_traits>;
        
        static void init(ref_type &ref, value_type &old, const value_type &bits ){
            old = ref;            
        }
        
        static void restore(ref_type &ref, value_type &old, const value_type &bits){
            pushbits_traits_set<T>::restore(ref, old, bits);
            pushbits_traits_clear<T>::restore(ref, old, bits);
        }        
    };
    
    template<class Traits>
    class pushbits_impl{
        using ref_type = typename Traits::ref_type;
    public:
        using value_type = typename Traits::value_type;
        using dest_type = typename Traits::dest_type;
        
    private:
        ref_type m_obj;
        value_type m_old, m_bits;
        
    public:
        pushbits_impl(dest_type &dest, const value_type &bits):
            m_obj(dest),
            m_old(m_obj),
            m_bits(bits){
                
            Traits::init(m_obj, m_old, bits);
        }
        
        ~pushbits_impl(){
            Traits::restore(m_obj, m_old,  m_bits);
        }        
    };
}

template<typename T>
class pushbits_clear:public impl::pushbits_traits_clear<T>::impl_type{
    using impl_type = typename impl::pushbits_traits_clear<T>::impl_type;
public:
  
    using impl_type::impl_type;
};


template<typename T>
class pushbits_set:public impl::pushbits_traits_set<T>::impl_type{
    using impl_type = typename impl::pushbits_traits_set<T>::impl_type;
public:  
    using impl_type::impl_type;
};

template<typename T>
class pushbits:public impl::pushbits_traits<T>::impl_type{
    using impl_type = typename impl::pushbits_traits<T>::impl_type;
public:  
    using impl_type::impl_type;
};
    
}  
}