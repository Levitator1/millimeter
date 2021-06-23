#pragma once

#include <avr/io.h>
#include "types.hpp"
#include "Config.hpp"
#include "Measurement.hpp"
#include "arduino/ArduinoDigital.hpp"
#include "FrequencyCounter.hpp"

namespace levitator{
namespace ardmeter{

class InductanceMeter{
        
public:
    using power_pin_type = arduino::ArduinoDigital<Config::charge_inductance_pin>;    
    using ground_pin_type = arduino::ArduinoDigital<Config::resonant_ground_pin>;    
    
private:
    static power_pin_type vcc_power_pin;
    static ground_pin_type ground_pin;
    
    const Config m_config;    
    //void dump_samples( const ad_sample *samples, const microseconds *times, microseconds startT, size_t n );
        
    /*static constexpr inline auto combine_power_pins(){        
        return power_pin_type().prop_mode.combine( resonant_ground_pin_type().prop_mode );
    }*/
    
    using power_mask_type = decltype(power_pin_type().prop_mode.combine( ground_pin_type().prop_mode ));
    //using power_mask_type = decltype(combine_power_pins());
    //power_mask_type m_power;
    static power_mask_type m_power_mask;
    
public:
    InductanceMeter(const ardmeter::Config &conf);
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
    
    //Disconnect the resonant circuit from power, leaving the analog comparator
    //connected to sense the wave edges
    inline void unload_device(){
        
        //puts("Setting power mask to power off...\n");      
        m_power_mask = false; //Switching to input mode tri-states the pins, leaving them close to floating
    }

    //Charge the resonant circuit
    inline void load_device(){
        //puts("Setting power mask to power on...\n");
        
        //Set output mode first, or altering the output bits produces some weird inconsistent hardware state
        //where the electrical output doesn't match the PORT bits
        m_power_mask = true;
        
        //We assume the default output state is low, so we save a clock cycle or two not setting the ground pin
        vcc_power_pin = true;        
    }

};

}
}

