#include "include/util/cplusplus.hpp"
#include "include/Console.hpp"

using namespace levitator::consolens;

extern "C" void __cxa_pure_virtual(){
    console.cprintf("WARNING: PURE VIRTUAL FUNCTION CALLED\n");
}

