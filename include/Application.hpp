#pragma once
#include "Config.hpp"
#include "InductanceMeter.hpp"
#include "CommandHandler.hpp"
#include "commands/UnknownCommand.hpp"
#include "commands/MeasureInductance.hpp"
#include "Interactive.hpp"

namespace levitator{
namespace ardmeter{

class Application:public arduino::Interactive{

    UnknownCommand unknown_handler;
    MeasureInductance measure_inductance_handler;

    arduino::CommandHandler *m_handlers[2] = { &measure_inductance_handler, nullptr };

public:    
    Config config = {};
    //InductanceMeter inductance_meter = {config, config.charge_inductance_pin};

    Application();
    void init();

    void measure_inductance();
    
};

}
}
