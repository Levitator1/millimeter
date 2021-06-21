#pragma once

#include "types.hpp"
#include "util/util.hpp"
#include "arduino/BoardConfig.hpp"

namespace levitator{
namespace ardmeter{

//
// By default, we target the exceedingly economical Arduino Pro Mini, which comes
// in 3.3V and 5V varieties. It is powered by an atmega328p microcontroller.
//
struct Config{

     //* Implementor-configurable stuff, in case you go with a 5V device, or you
     //* have a precise value for your shunt resistor.

    //Common system switched-regulated power supply voltage which is also used
    //to charge inductors for inductance measurement.
    //Also, the top of the range of the A/D units is automatically 
    //calibrated to vcc by the hardware, so max A/D sample corresponds to vcc.
    static constexpr double default_vcc = arduino::Config::vcc;        
    static constexpr ulong system_clock = arduino::Config::system_clock; //On the 328p, 8million or double that depending on VCC

    //The voltage across the inductance shunt resistor will be probed by the A/D
    //channel to calculate the current flow through the circuit.
    //This resistor serves as the current shunt, and also as the current-limiting
    //resistor to protect the digital output which charges the inductor for testing.
    //The atmega328p has a current limit of 40mA on digital outputs, so we select
    //this resistor to limit equal or lesser.

    //static constexpr double default_inductance_shunt_r = 82.5; //Ideal for 3.3V
    static constexpr double default_inductance_shunt_r = 98.2;   //Actual resistor I have


    //Fixed hardware properties
    static constexpr int ad_max = 1023; //Max sample value from Arduino A/D
                                        //which is usually 10 bits, but sometimes 12

    //I/O pins and wiring
    //These should be located on the same digital port so that + and GND can be disconnected simultaneously,
    //in a single instruction
    static constexpr pin_id charge_inductance_pin = 2;      //Routes VCC to charge inductance-testing resonant circuit
    static constexpr pin_id charge_capacitance_pin = 3;     //Routes VCC to charge the capacitance-testing resonant circuit
    static constexpr pin_id resonant_ground_pin = 4;        //So that the common ground can be disconnected from the resonant circuits
                                                            //Otherwise, they seem to discharge immediately
    static constexpr pin_id reset_drive_pin = 12;          //When set low, this pin will drive the hardware RST pin and effect a device reset
                                                            //because it's wired that way
       
    /*
    * Instance variables so that configuration can be read and written from EPROM
    */
    double vcc = default_vcc;
    double shunt_r = default_inductance_shunt_r;
};

}

//Export the configuration to other components
using shared_config = ardmeter::Config;

}

