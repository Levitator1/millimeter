# millimeter

Most minimal $10 homemade Arduino-based multimeter
==================================================

It seems as though the typical multimeter is confined mostly to voltage, current, and resistance,
and that meters which go beyond that become rapidly expensive. In particular, I am finding multimeters
at $450 which still do not measure inductance.

So, my objective with this project is to make an inductance meter out of a $10 arduino, plus some random
spare parts readily acquired from disassembling scrap electronics. An Arduino Pro Mini clone could be had, some
years ago for $5, and the USB-to-serial board to talk to it and program it from a PC was similarly priced.
An equivalent modern Arduino is a bit nicer, and comes with integrated USB, for about the same net price.

This project will proceed with an Arduino Pro Mini based on the atmega328p MCU, operating at 3.3V. It should
be easy to port the project to newer devices, as 8-bit AVR-based Arduinos are very similar.

## Current progress

### 06/09/2021
I guess the first objective is to function as a frequency counter. This is a useful end-user function in itself,
but in addition, this is how I intend to derive capacitance and inductance values. Once we can read
Hz, then we can route an inductance probe to a known capacitance, or a capacitance probe to a known inductance.
If we know one of these figures and we can sense the resonant frequency of the resulting LC circuit, then we
can calculate the unknown and display a reading.

