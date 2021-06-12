#include <stdio.h>
#include "Console.hpp"
#include "commands/UnknownCommand.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;
using namespace levitator::ardmeter;

UnknownCommand::UnknownCommand():
    CommandHandler(""){
}

void UnknownCommand::handle(Interactive &, const String &cmd, size_t pos ){
    console.cprintf("Unrecognized command: %s\n", cmd.substr(0, pos).c_str());    
}
