#pragma once
#include "../CommandHandler.hpp"

namespace levitator{
namespace ardmeter{

class MeasureInductance:public arduino::CommandHandler{
public:
    MeasureInductance();    
    virtual void handle(arduino::Interactive &state, const String &cmd, size_t pos) override;
};

}
}
