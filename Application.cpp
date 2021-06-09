#include "include/Application.hpp"
#include "include/Config.hpp"
#include "include/Console.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;

//static CommandHandler command_handlers = {  };

Application::Application():
    Interactive(m_handlers, &unknown_handler){    
}

void Application::init(){
    console = {&Serial, true};
    console.println("===========================================");
    console.println("ardmeter v0.01" );
    console.println("An inductance multimeter from a $5 Arduino");
    console.println("===========================================");
    console.println();
    
    //Analog reference is set to VCC which is probably 3.3V, or alternately 5V
    analogReference(DEFAULT);      
    
    inductance_meter.init();
}

void Application::measure_inductance(){
    auto result = inductance_meter.measure();
    console.print("L: ");
    console.println(result);
}
