#include "include/Application.hpp"
#include "include/Config.hpp"
#include "include/Console.hpp"
#include "include/avr/HardwareUART.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;
using namespace levitator::avr;

//static CommandHandler command_handlers = {  };

Application::Application():
    Interactive(m_handlers, &unknown_handler){    
}

//TODO: Put the baud in configuration
static UART0 uart0(9600);
static UART0::file_type console_stream = uart0.make_stdio_file();

void Application::init(){
    console = {&console_stream, &console_stream, true};        
        
    //DEBUG
    while(true){ uart0.write('X'); }
    
    
    console.cprintf("\n===========================================\n");
    console.cprintf("ardmeter v0.01\n" );
    console.cprintf("An inductance multimeter from a $5 Arduino");
    console.cprintf(  "===========================================\n\n");            
    
    //Analog reference is set to VCC which is probably 3.3V, or alternately 5V
    
    //DEBUG
    //analogReference(DEFAULT);    
    //inductance_meter.init();
}

void Application::measure_inductance(){
    //DEBUG
    /*
    auto result = inductance_meter.measure();
    console.print("L: ");
    console.println(result);
    */
}
