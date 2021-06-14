#pragma once

#include "avr_types.hpp"
#include "../util/cplusplus.hpp"

namespace levitator{
namespace avr{
    
//A device property that maps directly to an entire register
//Maybe you could get away with a word of a register, I don't know.
template<typename RegAddr>
class register_property:public RegAddr{
public:
    using RegAddr::RegAddr;
    register_property() = delete;
};

//Example Regs structure for bit_property
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

template<class RegType, class BitType, class Guard = atomic_guard_restore>
class bit_property{        

public:
    using register_type = RegType;
    using bit_type = BitType;
    
private:
    register_type m_register;
    bit_type m_bit;
    
public:        
    using guard_type = Guard;

    bit_property( register_type &reg, bit_type &bit):
        m_register(reg),
        m_bit(bit){}

    operator bool() const{
        return get();
    }

    bit_property &operator=(bool v){
        set(v);
        return *this;
    }

    bool get() const{
        return m_register & _BV(m_bit);
    }

    void set(){
        m_register |= _BV(m_bit);
    }
    
    void clear(){
        m_register &= ~_BV(m_bit);
    }
    
    void assign(bool v){
        if(v)
            set();
        else
            clear();
    }
};

/*
template<class Regs, class Guard = avr::atomic_guard_restore>
auto make_bit_property(Regs &regs, meta::type_ref<Guard> = {}){
    return bit_property<Regs, Guard>(regs);
}
*/

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
