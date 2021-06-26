#pragma once

#include "atomic.hpp"

namespace levitator{
namespace avr{
 
namespace impl{
    
    template<typename Traits>
    class pushbits_impl;
    
    template<typename T>
    struct pushbits_traits_base{
        using reg_type = T;                                 //We refer to each register via atomic to ensure atomicity
        using value_type = typename reg_type::value_type;   //The values we pass around
        using dest_type = typename reg_type::dest_type;     //The actual backing variable or register
    };
    
    template<typename T>
    struct pushbits_traits_clear:public pushbits_traits_base<T>{
        using base_type = pushbits_traits_base<T>;
        using reg_type = typename base_type::reg_type;
        using value_type = typename base_type::value_type;
        using dest_type = typename base_type::dest_type;
        using impl_type = pushbits_impl<pushbits_traits_clear>;
        
        static void init(reg_type &reg, value_type &old, const value_type &bits ){
            old = reg;
            reg &= ~bits;
        }
        
        static void restore(reg_type &reg, value_type &old, const value_type &bits){
            reg |= bits & old;
        }        
    };
    
    template<typename T>
    struct pushbits_traits_set:public pushbits_traits_base<T>{
        using base_type = pushbits_traits_base<T>;
        using reg_type = typename base_type::reg_type;
        using value_type = typename base_type::value_type;
        using dest_type = typename base_type::dest_type;
        using impl_type = pushbits_impl<pushbits_traits_set>;
        
        static void init(reg_type &reg, value_type &old, const value_type &bits ){
            old = reg;
            reg |= bits;
        }
        
        static void restore(reg_type &reg, value_type &old, const value_type &bits){
            reg &= ~(bits & ~old);
        }        
    };
    
    template<typename T>
    struct pushbits_traits:public pushbits_traits_base<T>{
        using base_type = pushbits_traits_base<T>;
        using reg_type = typename base_type::reg_type;
        using value_type = typename base_type::value_type;
        using dest_type = typename base_type::dest_type;
        using impl_type = pushbits_impl<pushbits_traits>;
        
        static void init(reg_type &reg, value_type &old, const value_type &bits ){
            old = reg;
        }
        
        static void restore(reg_type &reg, value_type &old, const value_type &bits){
            pushbits_traits_set<T>::restore(reg, old, bits);
            pushbits_traits_clear<T>::restore(reg, old, bits);
        }        
    };
    
    template<class Traits>
    class pushbits_impl{
        using reg_type = typename Traits::reg_type;
    public:
        using value_type = typename Traits::value_type;
        using dest_type = typename Traits::dest_type;
        
    private:
        reg_type m_reg;
        value_type m_old, m_bits;
        
    public:
        pushbits_impl(const reg_type &dest, const value_type &bits):
            m_reg(dest),
            m_old(m_reg),
            m_bits(bits){
                
            Traits::init(m_reg, m_old, bits);
        }
        
        ~pushbits_impl(){
            Traits::restore(m_reg, m_old,  m_bits);
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