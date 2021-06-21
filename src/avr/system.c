#include <util/atomic.h>
#include "avr/asm.h"


/* This seemed like a really easy way to reboot, but then it turns out that it
    it only restarts the software and the hardware is not reset
 */
EXTERN void avr_reboot(){    
    __asm__(" JMP 0x0000 ");    
}


//Set the watchdog timer to the minimum delay of 16ms and let it restart
//This is even worse, because the system goes into some sort of failsafe
//infinite reboot mode that the Arduino firmware doesn't know how to resolve,
//and the yellow status light just flashes indefinitely.
/*
EXTERN void avr_reboot(){    
     cli();    
     WDTCSR |= _BV(WDCE);   //enable watchdog editing
     WDTCSR = _BV(WDP0) | _BV(WDP1) | _BV(WDP3);     //Set a delay
     WDTCSR |= _BV(WDCE);   //enable watchdog editing
     WDTCSR |= _BV(WDE);
     sei();
     while(1){}
}
*/
