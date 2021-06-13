#pragma once
#include "../CommandHandler.hpp"

namespace levitator{
namespace ardmeter{

class RebootCommand:public arduino::CommandHandler{
public:
    RebootCommand();    
    virtual void handle(arduino::Interactive &state, const String &cmd, size_t pos) override;
};

}
}