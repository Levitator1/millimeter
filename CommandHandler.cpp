#include "include/types.hpp"
#include "include/CommandHandler.hpp"

//using namespace levitator::ardmeter;
using namespace levitator::arduino;


CommandHandler::CommandHandler(const char *name):
    m_name(name){
}

levitator::const_string CommandHandler::name() const{
    return m_name;
}