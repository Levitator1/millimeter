#include "Application.hpp"
#include "commands/MeasureInductance.hpp"

using namespace levitator::ardmeter;

MeasureInductance::MeasureInductance():
    CommandHandler("L"){    
}

void MeasureInductance::handle(arduino::Interactive &state, const String &cmd, size_t pos){
    state.upcast<Application>().measure_inductance();
}

