/*
*
* An interactive program
*
*/
#pragma once

#include "types.hpp"
#include "CommandHandler.hpp"

namespace levitator{
namespace arduino{

class Interactive{
    
    CommandHandler **m_handlers;
    CommandHandler *m_unknown_handler;

public:    
    Interactive(CommandHandler **handlers, CommandHandler *unknown_handler );
    inline virtual ~Interactive(){}

    template<typename T>
    T &downcast(){
        //-fno-rtti by convention on Arduino, and maybe a good idea given memory constraints
        //return *dynamic_cast<T *>(this);
        return *static_cast<T *>(this); //unsafe
    }

    //Process a command string or line of text
    void process(const String &cmd);
            
    //Infinite loop that does poll_command() and process() forever
    void run();    
};

}
}
