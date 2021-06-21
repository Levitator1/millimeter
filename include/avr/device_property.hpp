#pragma once

#include "avr_types.hpp"
#include "../util/cplusplus.hpp"

//DEBUG
#include "../Console.hpp"

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

/*
template<typename RegType, regptr<RegType> Regp, bit_number Bit>
struct static_bit_property_regs{
    using reg_type = RegType;    
    static reg_type &reg;
    static constexpr bit_number bit = Bit;
};
*/

template<class RegType, class BitMaskType>
class bit_mask_property;

template<typename RegType, typename MaskType>
auto make_bit_mask_property(RegType &reg, const MaskType &mask){
    return bit_mask_property<RegType, MaskType>(reg, mask);
}

//Applies a bitmask when set true,
//Masks it out when set false
template<class RegType, class BitMaskType>
class bit_mask_property{

public:
    using register_type = RegType;
    using mask_type = BitMaskType;

private:
    register_type m_register;
    mask_type m_mask;
        
public:
    template<bool is_static = util::is_static_storage<typename register_type::regptr_storage_type>::value && util::is_static_storage<mask_type>::value>
    bit_mask_property(){
        static_assert(is_static, "Default initialization is probably an error without static parameters");
    }
    
    constexpr bit_mask_property( register_type &reg, const mask_type &mask = {}):
        m_register(reg),
        m_mask(mask){}

    inline register_type &reg(){
        return m_register;
    }
    
    inline const register_type &reg() const{
        return m_register;
    }
        
    //This is a template so that it can still compile if register_type is a scalar
    //or otherwise has no guard_type
    template<class Null=void>
    using guard_type = typename register_type::guard_type;
        
    inline bit_mask_property &operator=(bool v){
        assign(v);
        return *this;
    }

    inline constexpr const mask_type &mask() const{
        return m_mask;
    }
    
    inline operator bool() const{
        return get();
    }
    
    inline bool get() const{
        return (m_register & m_mask) == m_mask;
    }

    inline void set(){
        //consolens::console.cprintf("PRE: register: %x,", (int)m_register.address());
        //consolens::console.cprintf(" value: %x, ", util::integer_value(m_register));
        //consolens::console.cprintf("mask: %x\n", util::integer_value(m_mask));
        m_register |= m_mask;
        //consolens::console.cprintf("POST: register: %x,", (int)m_register.address());
        //consolens::console.cprintf(" value: %x, ", util::integer_value(m_register));
        //consolens::console.cprintf("mask: %x\n", util::integer_value(m_mask));        
    }
    
    inline void clear(){
        m_register &= ~m_mask;
    }
    
    inline void assign(bool v){
        if(v)
            set();
        else
            clear();
    }
    
private:
    template<typename Rhs>
    struct combine_type_impl;
    
    template<typename RegType2, typename MaskType2>
    struct combine_type_impl<bit_mask_property<RegType2, MaskType2>> {
        using result = decltype(make_bit_mask_property( cpp::declval<register_type>(),  util::bitwise_or_storage(cpp::declval<mask_type>(), cpp::declval<MaskType2>()) ));
    };
    
public:    
    template<typename Rhs>
    using combine_type = typename combine_type_impl<Rhs>::result;
    
    //Combine two bitwise properties if they share the same register
    //The combined property reads and writes them together in one operation
    template<typename RegType2, typename MaskType2>
    inline constexpr combine_type<bit_mask_property<RegType2, MaskType2>> combine( const bit_mask_property<RegType2, MaskType2> &rhs ){
        aassert( registers_are_same( &reg(), &rhs.reg() ) );
        return make_bit_mask_property( m_register,  util::bitwise_or_storage(mask(), rhs.mask()));
    }
    
    /*
    template<typename RegType2, typename InitType, InitType InitVal>
    inline constexpr auto combine( 
        const bit_mask_property<
            RegType2,
            util::static_const_storage_tag<InitType, InitVal> > &rhs ){
        
        return make_bit_mask_property(reg(), mask() | rhs.mask());
    }
    */
};

//template<typename RegType, typename MaskType>
//bit_mask_property(RegType &, const MaskType &) -> bit_mask_property<RegType, MaskType>;

template<class RegType, class BitNumberType>
class bit_property:public bit_mask_property<RegType, typename bitno_2_mask<RegType, BitNumberType>::mask_type >{
    using base_type = bit_mask_property<RegType, typename bitno_2_mask<RegType, BitNumberType>::mask_type >;
public:
    using register_type = RegType;
    using bit_number_type = BitNumberType;
    
    //bit_property() = delete;
    
    constexpr bit_property( register_type reg = {}, bit_number_type bit = {}):
        base_type(reg, bitno_2_mask<register_type, bit_number_type>::convert(bit)){}
    
    inline bit_property &operator=(bool v){
        base_type::operator=(v);
        return *this;
    }
    
    //Slight optimization since we know we only have one bit in the mask
    inline operator bool() const{
        return get();
    }
    
    inline bool get() const{
        return this->reg() & this->mask();
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
