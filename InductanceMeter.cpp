#include "include/Config.hpp"
#include "include/Console.hpp"
#include "include/ringbuffer.hpp"
#include "include/Measurement.hpp"
#include "include/Application.hpp"
#include "include/InductanceMeter.hpp"
#include "include/avr/atmega328p/HWTimer.hpp"
#include "include/avr/AnalogComparator.hpp"
#include "include/Time.hpp"

using namespace levitator;
using namespace levitator::ardmeter;
using namespace levitator::consolens;
using namespace levitator::measurement;
using namespace levitator::containers;
using namespace levitator::avr;
using namespace levitator::util;

//DEBUG
#ifdef false

levitator::ardmeter::InductanceMeter::InductanceMeter(levitator::ardmeter::Config const &config, pin_id charge_pin):
    m_config(config),
    m_charge_pin(charge_pin){
}

void InductanceMeter::init(){
    //We assume the application globally initializes the AD reference to internal/vcc
    unload_device();
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

#endif
