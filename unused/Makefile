BOARD_TAG   = pro328
#BOARD_SUB   = atmega328
#ARDUINO_DIR = /where/you/installed/arduino-1.6.5
include /usr/share/arduino/Arduino.mk

# Add additional configurations as they are found to work
BOARD_SPECIFIC_MODULES_pro328 = HWTimer_atmega328p.o

##
## End config stuff
##

COMMON_MODULES := main.o Interactive.o Application.o CommandHandler.o Console.o LevSerial.o InductanceMeter.o MeasureInductance.o util.o AnalogComparator.o atomic.o HWTimerCommon.o
BOARD_SPECIFIC_MODULES := $(BOARD_SPECIFIC_MODULES_$(BOARD_TAG))

all: ardmeter

ardmeter: $(COMMON_MODULES) $(BOARD_SPECIFIC_MODULES)

