#pragma once

#include "avr_types.hpp"
#include "atomic.hpp"
#include "../util/cplusplus.hpp"

namespace levitator{
namespace avr{
    
//A device property that maps directly to an entire register
template<typename T>
class register_property:public atomic_ref<T>{
public:
    using atomic_ref<T>::atomic_ref;
    register_property() = delete;
};


// Example Regs structure for bit_property
//struct bit_property_regs{
//    ioreg8 reg;
//    bit_number bit;
//};

template<typename RegType, regptr<RegType> Regp, bit_number Bit>
struct static_bit_property_regs{
    using reg_type = RegType;    
    static reg_type &reg;
    static constexpr bit_number bit = Bit;
};

template<typename RegType, regptr<RegType> Regp, bit_number Bit>
RegType &static_bit_property_regs<RegType, Regp, Bit>::reg = *Regp;

template<regptr<ioreg8> Regp, bit_number Bit>
struct static_bit_property_regs8:public static_bit_property_regs<ioreg8, Regp, Bit>{};

template<regptr<ioreg16> Regp, bit_number Bit>
struct static_bit_property_regs16:public static_bit_property_regs<ioreg16, Regp, Bit>{};

template<class Regs, class Guard = atomic_guard_restore>
class bit_property{
    using ref_type = avr::atomic_ref<typename Regs::reg_type, Guard>;
    ref_type m_val;
    
public:
    using regs_type = Regs;
    using value_type = typename decltype(m_val)::value_type;
    using dest_type = typename decltype(m_val)::dest_type;
    using guard_type = typename decltype(m_val)::guard_type;
            
    
private:    
    regs_type regs;    

public:    
    bit_property( regs_type &regs = regs_type{} ):
        regs(regs){}
    
    operator bool() const{
        return get();
    }
    
    bit_property &operator=(bool v){
        set(v);
        return *this;
    }
    
    bool get() const{
        return regs.reg & _BV(regs.bit);
    }
    
    void set(bool v){
        if(v)
            regs.reg |= _BV(regs.bit);
        else
            regs.reg &= ~_BV(regs.bit);
    }
};

template<class Regs, class Guard = avr::atomic_guard_restore>
auto make_bit_property(Regs &regs, meta::type_ref<Guard> = {}){
    return bit_property<Regs, Guard>(regs);
}

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
