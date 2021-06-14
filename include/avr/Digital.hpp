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

template<class RegList, class BitList>
struct DIORegs{
private:
    assert_regs_count<RegList, BitList, 3, 3>;    

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
    bit_property<decltype(regs_type::port)> prop_value_in;
    bit_property<decltype(regs_type::pin)> prop_value_out;
    bit_property<decltype(regs_type::ddr)> prop_mode;

    Digital(regs_type &regs):        
        m_regs(m_regs),
        prop_value_in(regs.port, regs.portxn),
        prop_value_out(regs.pin, regs.pinxn),
        prop_mode(regs.ddxn){
    }

    inline operator bool() const{
        return value;
    }        
    
    inline Digital &operator=(bool v){
        prop_value_out = v;
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
struct DigitalPinRegMap<i>:public DIORegs< \
    &PIN##port, PIN##port##pin, \
    &PORT##port, PORT##port##pin, \
    &DDR##port, DD##port##pin>{ static constexpr bool undefined = false; }

}
}