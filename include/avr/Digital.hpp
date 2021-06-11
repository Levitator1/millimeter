#pragma once
#include "avr_types.hpp"
#include "device_property.hpp"

// Digital GPIO

namespace levitator{
namespace avr{

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

//A virtual interface so that you can stuff a bunch of DIO references in an
//array or something and access them uniformly
class DigitalInterface{
    virtual bool value_in() const = 0;
    virtual void value_out(bool v) = 0;
    virtual bool value_out() const = 0;
    virtual void mode(bool ) = 0;
    virtual bool mode() const = 0;
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
    bit_property<MEMBER_RETURN(regs_type, value_in_regs)> prop_value_in;
    bit_property<MEMBER_RETURN(regs_type, value_out_regs)> prop_value_out;
    bit_property<MEMBER_RETURN(regs_type, mode_regs)> prop_mode;
    
    Digital(regs_type &regs):        
        m_regs(m_regs),
        prop_value_in(regs.value_in_regs),
        prop_value_out(regs.value_out_regs),
        prop_mode(regs.mode_regs){
    }
        
    inline operator bool() const{
        return value;
    }        
    
    inline Digital &operator=(bool v){
        value = v;
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
};

//Map I to each register definition
template< int I >
struct DigitalPinRegMap{
    static constexpr bool undefined = true;
};

#define DEFINE_DIGITAL_PIN_REGS(i, port, pin) \
template<> \
struct DigitalPinRegMap<i>:public static_digital_regs< \
    &PIN##port, PIN##port##pin, \
    &PORT##port, PORT##port##pin, \
    &DDR##port, DD##port##pin>{ static constexpr bool undefined = false; }

}
}