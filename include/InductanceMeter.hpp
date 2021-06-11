#pragma once

#include "types.hpp"
#include "Config.hpp"
#include "Measurement.hpp"

namespace levitator{
namespace ardmeter{

class InductanceMeter{

    const Config m_config;
    const pin_id m_charge_pin;

    //void dump_samples( const ad_sample *samples, const microseconds *times, microseconds startT, size_t n );

public:
    InductanceMeter( const Config &config, pin_id charge_pin);
    void init();

    //Perform the complete process of taking an inductance reading
    real measure();
    
    /*
    //Read a raw unscaled sample from the A/D
    inline ad_sample read_sample(){
        return analogRead( m_sense_pin );        
    }

    //Convert an A/D sample to a voltage reading
    double sample2V( ad_sample v );

    //Convert a voltage to its corresponding A/D reading
    ad_sample V2sample(real v);
    */
      
    inline void unload_device(){
        //DEBUG
        //pinMode(m_charge_pin, INPUT);
        //digitalWrite(m_charge_pin, LOW);        
    }

    //Charge the device with VCC with the shunt/limiting resistor in series
    inline void load_device(){
        //DEBUG
        //digitalWrite(m_charge_pin, HIGH);    //Pull-up resistor comes on
        //pinMode(m_charge_pin, OUTPUT);      //+VCC out
    }

};

}
}

