#pragma once

/*
 *
 * The AVR libc provides a very simplified and unbuffered FILE implementation
 * which accepts callbacks which can be routed to virtually any I/O source.
 * Here, we extend it to add the ability to poll for input.
 * 
 */

#include <stdio.h>

namespace levitator{
namespace avr{

//This really should be FILE, but AVR stdlib is implemented so that FILE is
//

//using stdio_type = decltype(stdin);
    
struct FILE_EX:public FILE{    
    virtual int available() const = 0;
};
    
}
}