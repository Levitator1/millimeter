#include "Config.hpp"
#include "Console.hpp"
#include "ringbuffer.hpp"
#include "Measurement.hpp"
#include "Application.hpp"
#include "InductanceMeter.hpp"
#include "avr/atmega328p/HWTimer.hpp"
#include "avr/AnalogComparator.hpp"
#include "arduino/ArduinoDigital.hpp"
#include "Time.hpp"
#include "System.hpp"

using namespace levitator;
using namespace levitator::ardmeter;
using namespace levitator::consolens;
using namespace levitator::measurement;
using namespace levitator::containers;
using namespace levitator::avr;
using namespace levitator::util;
using namespace levitator::arduino;

InductanceMeter::power_mask_type InductanceMeter::m_power_mask = {};
InductanceMeter::power_pin_type InductanceMeter::vcc_power_pin = {};
InductanceMeter::ground_pin_type InductanceMeter::ground_pin = {};

levitator::ardmeter::InductanceMeter::InductanceMeter(const levitator::ardmeter::Config &config):
    m_config(config){
}

void InductanceMeter::init(){
    //We assume the application globally initializes the AD reference to internal/vcc
    
    //Globally disable the pull-up resistors
    //Normally, you're supposed to be able to alter the output bits while in input mode
    //But it appears to be that if you disable the pullup resistors, this becomes undefined behavior?
    //So, set the mode to output first, then update the high/low state
    System::pullup_disable_bit = true;
    
    //Make sure the inductance charging circuit is off
    //This really just sets the power pins to input/hi-z
    unload_device();
    
    //Set the power pin outputs to be + and - as appropriate
    //Now, when they are switched back to output mode, they will instantly deliver power
   // vcc_power_pin.prop_value_out.reg() = util::null_type();
    
    //console.cprintf("Setting vcc to + power. Reg address: %x", vcc_power_pin.prop_value_out.reg().address().get());
    //console.cprintf(", value: %x", (int)vcc_power_pin.prop_value_out.reg());
    //console.cprintf(", mask: %x\n", (int)vcc_power_pin.prop_value_out.mask());
    vcc_power_pin = true;
    //console.cprintf("After setting vcc to + power. Reg address: %x", vcc_power_pin.prop_value_out.reg().address().get());
    //console.cprintf(", value: %x", (int)vcc_power_pin.prop_value_out.reg());
    //console.cprintf(", mask: %x\n\n", (int)vcc_power_pin.prop_value_out.mask());
    
    //console.cputs("Setting ground to - power\n");
    ground_pin = false;
    
}

/*
void InductanceMeter::dump_samples( const ad_sample *samples, const microseconds *times, microseconds startT, size_t n ){
    for(size_t i=0;i<n;++i){
        console.print("V: ");
        console.print( sample2V(samples[i]) );
        console.print("\tT: ");
        console.println(levitator::util::time_diff(times[i], startT));
    }
}
*/

real InductanceMeter::measure(){
    
    
    //ground_pin = false;
    //power_pin = false;
    //ground_pin.prop_mode = true;
    //power_pin.prop_mode = true;
    //power_pin = true;        
    
    //m_power_mask = true;
    //ground_pin = false;
    //vcc_power_pin = true;
    
    //PORTD |= 1;
    //console.cprintf("Power pin: DDR: %x, PORT: %x, PIN: %x\n", DDRD, PORTD, PIND);
    //console.cprintf( "BTW: PORTD2: %x PORTD4: %x, EICRA: %x\n", PORTD2, PORTD4, EICRA );
    load_device();
    
    return 0.0;
}

#if false
real InductanceMeter::measure(){    
    ad_sample maxDiff;        
    AnalogComparator comparator;
        
    using time_type = typename HWTimer1::time_type;
    auto &timer = HWTimer1::instance();
    
    constexpr uint n = 50;    
    time_type times[n] = {0}, dt;
    
    //DEBUG
    digitalWrite(6, LOW);
    pinMode(6, INPUT);
    digitalWrite(7, LOW);
    pinMode(7, INPUT);
    DIDR1 = 3;      //Disable digital IO on the analog comparator pins
    
    digitalWrite(2, HIGH);
    pinMode(2, OUTPUT);
    delay(1000);
    pinMode(2, INPUT);
    digitalWrite(2, LOW);
    
    auto ct = comparator.collect_events(timer, 1000000, 50, [&times](int i, uint t){
        times[i] = t;             
    });
    
    for(uint i=1;i<ct;++i){
        console.print("Sample #");
        console.print(i);
        console.print(", T: ");
        console.print(times[i]);
        auto dT = util::time_diff( times[i], times[i-1] );
        console.print(", dT: ");
        console.print(dT);
        console.print("cyc/");
        console.print(Time::cycles2ms(dT));
        console.print("ms, Hz:");
        console.println(Time::cycles2Hz(dT));
    }
        
    //DEBUG - comparator value scan
#if false
    while(2000){
        console.print( "Comparator: " );
        console.println( comparator.status );
    }
#endif
    
#if false
    //DEBUG - comparator event scan
    console.print("Waiting for comparator event");
    
    for(ulong i=0; i< 1000000; ++i){
        
        if(TIFR1 & _BV(ICF1)){
            auto cap = 
            TIFR1 |= _BV(ICF1);
            console.print( "Caught an event. Comparator status: " );
            console.println( comparator.status );
        }
    }
    console.println("Done.");
#endif
    
    return 0;
}
#endif

/*
real InductanceMeter::measure(){
    ad_sample maxDiff;
    
    console.println("Waiting for voltage to settle..."); //DBG
    auto settler = make_settle( static_ringbuffer<ad_sample, 3>(), [this](){ return  read_sample(); } );
    auto settle_avg = settler.do_settle(2, 3, 100, maxDiff);
    console.print("AVG:"); //DBG
    console.print(settle_avg); //DBG
    console.print(", VAR: "); //DBG
    console.println(maxDiff);  //DBG
    
    //Try to charge the device as little as possible to avoid huge transients upon
    //de-energize.
    //Grab a set of ten unique increasing values
    
    constexpr size_t n = 100;
    constexpr microseconds max_dt = 1000l * 1000 * 6; //Keep it to one ms to start    
    
    size_t o;
    ad_sample samples[n], samp;
    microseconds times[n], t;
    ad_sample max_sample = settle_avg;
    //sliding_average<ad_sample, static_ringbuffer<ad_sample, n> avg;
    
    microseconds startT = micros();
    load_device();    
    
    for(o=0; o<n;){
        samp = read_sample();
        t = micros();
        //if(samp > max_sample){
        if(true){
            samples[o] = samp;
            times[o] = t;
            ++o;
            max_sample = samp;
        }
        
        if( util::time_diff(t, startT) > max_dt ){
            unload_device();
            console.print("Timed out looking for dV. Samples: ");
            console.println(o);
            dump_samples(samples, times, startT, o);
            return 0;
        }        
    }
    unload_device();
    
    //Debug
    dump_samples(samples, times, startT, o);
        
    return 0;
}
*/
 

/*
real InductanceMeter::sample2V( ad_sample s ){
    return m_config.vcc * s / Config::ad_max;
}

ad_sample InductanceMeter::V2sample( real v ){
    return v * Config::ad_max / m_config.vcc;
}
*/
