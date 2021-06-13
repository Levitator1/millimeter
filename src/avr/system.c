#include "avr/system.h"


EXTERN void avr_reboot(){
    
    __asm__(" JMP 0x0000 ");
    
}