#pragma once
#include "Config.hpp"
#include "FrequencyCounter.hpp"
#include "InductanceMeter.hpp"
#include "CommandHandler.hpp"
#include "commands/UnknownCommand.hpp"
#include "commands/MeasureInductance.hpp"
#include "commands/RebootCommand.hpp"
#include "Interactive.hpp"

namespace levitator{
namespace ardmeter{

class Application:public arduino::Interactive{

    arduino::ArduinoDigital<Config::reset_drive_pin> reset_drive_pin;
    UnknownCommand unknown_handler;
    MeasureInductance measure_inductance_handler;
    RebootCommand reboot_handler;

    arduino::CommandHandler *m_handlers[3] = { &measure_inductance_handler, &reboot_handler, nullptr };

public:    
    Config config = {};
    
    InductanceMeter inductance_meter = {config};

    Application();
    void init();
    void reboot();
    void measure_inductance();
    
};

}
}
