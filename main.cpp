#ifndef NDEBUG
//#include <avr8-stub.h>
#endif

#include <Arduino.h>
#include "include/util/util.hpp"
#include "include/types.hpp"
#include "include/Console.hpp"
#include "include/Application.hpp"
#include "include/CommandHandler.hpp"
#include "include/commands/UnknownCommand.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;

//UnknownCommand unknown_handler;

//These arrays map the names of commands to handler
//static const_string command_names[] = { nullptr };
//static CommandHandler *command_handlers[] = { nullptr };
//Application app(&command_names[0], &command_handlers[0], &unknown_handler);
Application app;

void setup(){    
    app.init();    
}

void loop(){
    
    /*
    //Indutance circuit voltage loopback test
    pinMode(Config::charge_inductance_pin, OUTPUT);
    digitalWrite( Config::charge_inductance_pin, HIGH );    
    delay(1000);
    console.print("TEST: ");
    console.println( analogRead(Config::inductance_v_sense) );
    digitalWrite( Config::charge_inductance_pin, LOW );
    pinMode(Config::charge_inductance_pin, INPUT);
    */
    
    app.run();
}
