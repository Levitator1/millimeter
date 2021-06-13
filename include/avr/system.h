#pragma once

#ifdef __cplusplus
#   define EXTERN extern "C"
#else
#   define EXTERN
#endif

//Hopefully the same for all AVRs? On the 328p, you just JMP 0x0000
EXTERN void avr_reboot();


