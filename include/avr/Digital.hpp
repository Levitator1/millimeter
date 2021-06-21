#pragma once
#include "../util/util.hpp"
#include "../avr/atomic.hpp"
#include "avr_types.hpp"
#include "device_property.hpp"

// Digital GPIO

namespace levitator{
namespace avr{

/*
template<
    regptr<ioreg8> InputReg,
    bit_number input_bit,
    regptr<ioreg8> OutputReg,
    bit_number output_bit,
    regptr<ioreg8> ModeReg,
    bit_number mode_bit>
struct static_digital_regs{
    static_bit_property_regs8<InputReg, input_bit> value_in_regs;
    static_bit_property_regs8<OutputReg, output_bit> value_out_regs;
    static_bit_property_regs8<ModeReg, mode_bit> mode_regs;
};
*/

template<class RegList, class BitList>
struct DIORegs{
private:
    assert_regs_count<RegList, BitList, 3, 3> m_check_regdef_counts;    

public:    
    template<int I>
    using regtype = regdecl<RegList, I>;
    
    template<int I>
    using bittype = bitdecl<BitList, I>;

    regtype<0> ddr;
    regtype<1> port;
    regtype<2> pin;
    
    bittype<0> ddxn;
    bittype<1> portxn;
    bittype<2> pinxn;
};

//A virtual interface so that you can stuff a bunch of DIO references in an
//array or something and access them uniformly
class DigitalInterface{
    virtual bool value_in() const = 0;
    virtual void value_out(bool v) = 0;
    virtual bool value_out() const = 0;
    virtual void mode(bool ) = 0;
    virtual bool mode() const = 0;
    virtual void toggle() = 0;
};
    
template<class Regs>
class Digital:public DigitalInterface{
public:
    using regs_type = Regs;

private:
    regs_type m_regs;

protected:
    regs_type &regs(){
        return m_regs;
    }

    const regs_type &regs() const{
        return m_regs;
    }

public:
    bit_property<decltype(regs_type::ddr), decltype(regs_type::ddxn)> prop_mode;
    const bit_property<decltype(regs_type::port), decltype(regs_type::portxn)> prop_value_in;
    bit_property<decltype(regs_type::pin), decltype(regs_type::pinxn)> prop_value_out;    

    Digital(const regs_type &regs = {}):        
        m_regs(regs),      
        prop_mode(m_regs.ddr, m_regs.ddxn),
        prop_value_in(m_regs.port, m_regs.portxn),
        prop_value_out(m_regs.pin, m_regs.pinxn){
    }

    inline operator bool() const{
        return prop_value_in;
    }        
    
    //The pin has to be toggled in hardware, so it has to be read before write to find out whether it needs to be flipped, so that's a critical section
    inline Digital &operator=(bool v){
        //using guard_type_in = typename prop_value_in::guard_type;
        using guard_type_out = typename decltype(prop_value_out)::template guard_type<>;
        //static_assert( cpp:is_same<guard_type_in, guard_type_out>::value, "In and out properties are required to use the same guard type" );
        static_assert( 
                guard_traits<guard_type_out>::recursive,
                "Guard type must be util::null_type or be of the restoring kind" );
        
        atomic_guard_restore guard;
        if(v != prop_value_out)
            prop_value_out = true;
                
        return *this;
    }    
    
    //Virtual interface
    virtual bool value_in() const{
        return prop_value_in;
    }

    inline void value_out(bool v) override{
        prop_value_out = v;
    }

    bool value_out() const override{
        return prop_value_out;
    }
    
    void mode(bool v) override{
        prop_mode = v;
    }
    
    bool mode() const override{
        return prop_mode;
    }
    
    //Counter-intuitively writing a one to the output register does not commit
    //a high state to the hardware. It toggles it from high to low or vice versa.
    void toggle() override{
        prop_value_out = true;
    }
};


}
}