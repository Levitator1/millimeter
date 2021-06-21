#include "Console.hpp"
#include "commands/RebootCommand.hpp"
#include "avr/asm.h"
#include "Application.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;

RebootCommand::RebootCommand():
    CommandHandler("reboot"){
}

void RebootCommand::handle(Interactive &app, const String &cmd, size_t pos ){
    console.cprintf("Rebooting system...\n\n");
    app.downcast<Application>().reboot();
    //avr_reboot();
}
