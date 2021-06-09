#pragma once
#include "../CommandHandler.hpp"

namespace levitator{
namespace ardmeter{

class UnknownCommand:public arduino::CommandHandler{
public:
    UnknownCommand();    
    virtual void handle(arduino::Interactive &state, const String &cmd, size_t pos) override;
};

}
}
