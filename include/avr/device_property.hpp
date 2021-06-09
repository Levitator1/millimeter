#pragma once

#include "atomic.hpp"

namespace levitator{
namespace avr{
    
//A device property that maps directly to an entire register
template<typename T>
class register_property:public atomic_ref<T>{
public:
    using atomic_ref<T>::atomic_ref;
    register_property() = delete;
};

template<typename T, class Guard = atomic_guard_restore>
class bit_property{
    atomic_ref<T, Guard> m_val;    
    
public:
    using value_type = typename decltype(m_val)::value_type;
    using dest_type = typename decltype(m_val)::dest_type;
    using guard_type = typename decltype(m_val)::guard_type;
    
private:    
    value_type bv;

public:    
    bit_property(dest_type &dest, bit_number bit):
        m_val(dest),
        bv(_BV(bit)){}
    
    operator bool() const{
        return get();
    }
    
    bit_property &operator=(bool v){
        set(v);
        return *this;
    }
    
    bool get() const{
        return m_val & bv;
    }
    
    void set(bool v){
        if(v)
            m_val |= bv;
        else
            m_val &= ~bv;
    }
};
    
}

namespace util{
    
namespace impl{
template<typename T>
struct pushval_traits;    
    
template<typename T, class Guard>
struct pushval_traits< avr::bit_property<T, Guard> >{
    using value_type = typename avr::bit_property<T, Guard>::value_type;
    using dest_type = avr::bit_property<T, Guard>;
};
}

}
}
