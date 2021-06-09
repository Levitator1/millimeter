#include "include/commands/UnknownCommand.hpp"

using namespace levitator::arduino;
using namespace levitator::ardmeter;

UnknownCommand::UnknownCommand():
    CommandHandler(""){
}

void UnknownCommand::handle(Interactive &, const String &cmd, size_t pos ){
    Serial.print("Unrecognized command: ");
    Serial.println(cmd.substring(0, pos));
}