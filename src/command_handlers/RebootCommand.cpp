#include "Console.hpp"
#include "commands/RebootCommand.hpp"
#include "avr/system.h"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;

RebootCommand::RebootCommand():
    CommandHandler("reboot"){
}

void RebootCommand::handle(Interactive &, const String &cmd, size_t pos ){
    console.cprintf("Rebooting system...\n");
    avr_reboot();
}
