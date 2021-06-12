#include <string.h>
#include "types.hpp"
#include "util/util.hpp"
#include "Interactive.hpp"
#include "Console.hpp"

using namespace levitator::consolens;
using namespace levitator::arduino;

Interactive::Interactive( CommandHandler **handlers, CommandHandler *unknown_command ):    
    m_handlers(handlers),
    m_unknown_handler(unknown_command){    
}

void Interactive::process(const String &str){
    
    auto chars = str.c_str();
    
    //Find the end of the first word
    const char* name_end = ::strchr(chars, ' ');
    
    //If there are no spaces, then the whole string is a word
    if(name_end == NULL)
        name_end = &chars[ str.length() ];
    
    auto namelen = name_end - chars;
    
    //match a command name
    int i;
    for(i=0;m_handlers[i];++i){
        if( ::strncasecmp( chars, m_handlers[i]->name(), namelen) == 0 )
            break;
    }    
    
    if(m_handlers[i])
        m_handlers[i]->handle(*this, str, namelen);
    else
        m_unknown_handler->handle(*this, str, namelen); //Unknown command
}

void Interactive::run(){
    bool avail;
    while(true){
        
        auto result = console.read_line( &avail );
        if(avail)
            process(result);
    }
}
