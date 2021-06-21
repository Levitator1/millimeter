#include "Application.hpp"
#include "Config.hpp"
#include "Console.hpp"
#include "avr/HardwareUART.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;
using namespace levitator::avr;

Application::Application():
    Interactive(m_handlers, &unknown_handler){    
}

//TODO: Put the baud in configuration
static UART0 uart0(9600);
static UART0::file_type console_stream = uart0.make_tty_stream();

void Application::init(){
    console = {&console_stream, &console_stream, true};
    stdin = stdout = &console_stream;
    
    console.cprintf("\n===========================================\n");
    console.cprintf(  "ardmeter v0.01\n" );
    console.cprintf(  "An inductance multimeter from a $5 Arduino\n");
    console.cprintf(  "===========================================\n\n");                
    
    //Analog reference is set to VCC which is probably 3.3V, or alternately 5V
    
    //DEBUG
    //analogReference(DEFAULT);    
    inductance_meter.init();
}

void Application::reboot(){
    
    //Drive the RST pin low which should trigger hardware reset
    reset_drive_pin.prop_mode = true;
    reset_drive_pin = false;
}

void Application::measure_inductance(){        
    auto result = inductance_meter.measure();    
    console.cprintf("L: %f\n", result);
}
