#pragma once
#include "types.hpp"

namespace levitator{
namespace arduino{

class Interactive;

class CommandHandler{

private:    
    const_string m_name;

public:
    CommandHandler(const_string name);
    virtual const_string name() const;
    virtual void handle(Interactive &state, const String &cmd, size_t pos) = 0;
};

}
}