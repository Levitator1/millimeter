#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-debug.mk)" "nbproject/Makefile-local-debug.mk"
include nbproject/Makefile-local-debug.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=debug
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/avr/atmega328o/HWTimer_atmega328p.cpp src/util/atomic.cpp src/command_handlers/UnknownCommand.cpp src/command_handlers/MeasureInductance.cpp src/command_handlers/CommandHandler.cpp src/util/util.cpp src/util/cplusplus.cpp src/Application.cpp src/Console.cpp src/InductanceMeter.cpp src/Interactive.cpp src/main.cpp

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o ${OBJECTDIR}/src/util/atomic.o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o ${OBJECTDIR}/src/command_handlers/CommandHandler.o ${OBJECTDIR}/src/util/util.o ${OBJECTDIR}/src/util/cplusplus.o ${OBJECTDIR}/src/Application.o ${OBJECTDIR}/src/Console.o ${OBJECTDIR}/src/InductanceMeter.o ${OBJECTDIR}/src/Interactive.o ${OBJECTDIR}/src/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d ${OBJECTDIR}/src/util/atomic.o.d ${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d ${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d ${OBJECTDIR}/src/command_handlers/CommandHandler.o.d ${OBJECTDIR}/src/util/util.o.d ${OBJECTDIR}/src/util/cplusplus.o.d ${OBJECTDIR}/src/Application.o.d ${OBJECTDIR}/src/Console.o.d ${OBJECTDIR}/src/InductanceMeter.o.d ${OBJECTDIR}/src/Interactive.o.d ${OBJECTDIR}/src/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o ${OBJECTDIR}/src/util/atomic.o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o ${OBJECTDIR}/src/command_handlers/CommandHandler.o ${OBJECTDIR}/src/util/util.o ${OBJECTDIR}/src/util/cplusplus.o ${OBJECTDIR}/src/Application.o ${OBJECTDIR}/src/Console.o ${OBJECTDIR}/src/InductanceMeter.o ${OBJECTDIR}/src/Interactive.o ${OBJECTDIR}/src/main.o

# Source Files
SOURCEFILES=src/avr/atmega328o/HWTimer_atmega328p.cpp src/util/atomic.cpp src/command_handlers/UnknownCommand.cpp src/command_handlers/MeasureInductance.cpp src/command_handlers/CommandHandler.cpp src/util/util.cpp src/util/cplusplus.cpp src/Application.cpp src/Console.cpp src/InductanceMeter.cpp src/Interactive.cpp src/main.cpp

# Pack Options 
PACK_COMPILER_OPTIONS=-I "${DFP_DIR}/include"
PACK_COMMON_OPTIONS=-B "${DFP_DIR}/gcc/dev/atmega328p"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-debug.mk dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega328P
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o: src/avr/atmega328o/HWTimer_atmega328p.cpp  .generated_files/flags/debug/5b7bdb8ffa8ba4da66c741ab926f175988e28324 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/avr/atmega328o" 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o  -o ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o src/avr/atmega328o/HWTimer_atmega328p.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/atomic.o: src/util/atomic.cpp  .generated_files/flags/debug/dc7df8dfbfd998421411165fc45489cdd180834 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/atomic.o.d 
	@${RM} ${OBJECTDIR}/src/util/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/atomic.o.d" -MT "${OBJECTDIR}/src/util/atomic.o.d" -MT ${OBJECTDIR}/src/util/atomic.o  -o ${OBJECTDIR}/src/util/atomic.o src/util/atomic.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/UnknownCommand.o: src/command_handlers/UnknownCommand.cpp  .generated_files/flags/debug/971465dced6d14923899eabf6c58e0157fbf61db .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT ${OBJECTDIR}/src/command_handlers/UnknownCommand.o  -o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o src/command_handlers/UnknownCommand.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/MeasureInductance.o: src/command_handlers/MeasureInductance.cpp  .generated_files/flags/debug/480a8e01b542cd09966975802f7c07e18f644d9d .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT ${OBJECTDIR}/src/command_handlers/MeasureInductance.o  -o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o src/command_handlers/MeasureInductance.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/CommandHandler.o: src/command_handlers/CommandHandler.cpp  .generated_files/flags/debug/e8485e2c212dde402bd3cc942e6c6bc3ea2b317b .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT ${OBJECTDIR}/src/command_handlers/CommandHandler.o  -o ${OBJECTDIR}/src/command_handlers/CommandHandler.o src/command_handlers/CommandHandler.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/util.o: src/util/util.cpp  .generated_files/flags/debug/c389cce992399dd3c66a7dc0382c858f46a13132 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/util.o.d 
	@${RM} ${OBJECTDIR}/src/util/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/util.o.d" -MT "${OBJECTDIR}/src/util/util.o.d" -MT ${OBJECTDIR}/src/util/util.o  -o ${OBJECTDIR}/src/util/util.o src/util/util.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/cplusplus.o: src/util/cplusplus.cpp  .generated_files/flags/debug/ee671747aa355f846ca677dd29bf7cf0475a3473 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/cplusplus.o.d" -MT "${OBJECTDIR}/src/util/cplusplus.o.d" -MT ${OBJECTDIR}/src/util/cplusplus.o  -o ${OBJECTDIR}/src/util/cplusplus.o src/util/cplusplus.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Application.o: src/Application.cpp  .generated_files/flags/debug/3536379c67bdbfd0f81516a3a84274f356492c9f .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Application.o.d" -MT "${OBJECTDIR}/src/Application.o.d" -MT ${OBJECTDIR}/src/Application.o  -o ${OBJECTDIR}/src/Application.o src/Application.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Console.o: src/Console.cpp  .generated_files/flags/debug/81381e55caf496fe083342f2d572c2ef55449780 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Console.o.d 
	@${RM} ${OBJECTDIR}/src/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Console.o.d" -MT "${OBJECTDIR}/src/Console.o.d" -MT ${OBJECTDIR}/src/Console.o  -o ${OBJECTDIR}/src/Console.o src/Console.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/InductanceMeter.o: src/InductanceMeter.cpp  .generated_files/flags/debug/53756f61d7d673733aea7194f55559425585df5d .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/InductanceMeter.o.d" -MT "${OBJECTDIR}/src/InductanceMeter.o.d" -MT ${OBJECTDIR}/src/InductanceMeter.o  -o ${OBJECTDIR}/src/InductanceMeter.o src/InductanceMeter.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Interactive.o: src/Interactive.cpp  .generated_files/flags/debug/cc7e26b2a94f607aac4832cd35783f405fd86c6a .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interactive.o.d 
	@${RM} ${OBJECTDIR}/src/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Interactive.o.d" -MT "${OBJECTDIR}/src/Interactive.o.d" -MT ${OBJECTDIR}/src/Interactive.o  -o ${OBJECTDIR}/src/Interactive.o src/Interactive.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/main.o: src/main.cpp  .generated_files/flags/debug/495973191ea7d498a9cc0c616d9e241f45dde0c8 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/main.o.d" -MT "${OBJECTDIR}/src/main.o.d" -MT ${OBJECTDIR}/src/main.o  -o ${OBJECTDIR}/src/main.o src/main.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
else
${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o: src/avr/atmega328o/HWTimer_atmega328p.cpp  .generated_files/flags/debug/5b039591ae77b1eaac6b25f95c0c5b7c5c8933db .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/avr/atmega328o" 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o  -o ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o src/avr/atmega328o/HWTimer_atmega328p.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/atomic.o: src/util/atomic.cpp  .generated_files/flags/debug/5bc1d73adf3bbae2d2165973151550e60e7be7f4 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/atomic.o.d 
	@${RM} ${OBJECTDIR}/src/util/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/atomic.o.d" -MT "${OBJECTDIR}/src/util/atomic.o.d" -MT ${OBJECTDIR}/src/util/atomic.o  -o ${OBJECTDIR}/src/util/atomic.o src/util/atomic.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/UnknownCommand.o: src/command_handlers/UnknownCommand.cpp  .generated_files/flags/debug/e4731873cc57cdc740a79b3d76d41534de9e4763 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT ${OBJECTDIR}/src/command_handlers/UnknownCommand.o  -o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o src/command_handlers/UnknownCommand.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/MeasureInductance.o: src/command_handlers/MeasureInductance.cpp  .generated_files/flags/debug/8bc0ed1ff74339a888761f5445ddd9403b4349b5 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT ${OBJECTDIR}/src/command_handlers/MeasureInductance.o  -o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o src/command_handlers/MeasureInductance.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/CommandHandler.o: src/command_handlers/CommandHandler.cpp  .generated_files/flags/debug/a8f0b029e44cbbef8ed332c49892cacc65474d8e .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT ${OBJECTDIR}/src/command_handlers/CommandHandler.o  -o ${OBJECTDIR}/src/command_handlers/CommandHandler.o src/command_handlers/CommandHandler.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/util.o: src/util/util.cpp  .generated_files/flags/debug/c2bfa88a1f3e5d97f0a7715fc9af0649f32984ef .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/util.o.d 
	@${RM} ${OBJECTDIR}/src/util/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/util.o.d" -MT "${OBJECTDIR}/src/util/util.o.d" -MT ${OBJECTDIR}/src/util/util.o  -o ${OBJECTDIR}/src/util/util.o src/util/util.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/cplusplus.o: src/util/cplusplus.cpp  .generated_files/flags/debug/68aacd7c3056c8d6f91e1484a9b9eb7a4ea5aabe .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/cplusplus.o.d" -MT "${OBJECTDIR}/src/util/cplusplus.o.d" -MT ${OBJECTDIR}/src/util/cplusplus.o  -o ${OBJECTDIR}/src/util/cplusplus.o src/util/cplusplus.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Application.o: src/Application.cpp  .generated_files/flags/debug/997fd38a5d26002685f9e3ef60478065f98b66f8 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Application.o.d" -MT "${OBJECTDIR}/src/Application.o.d" -MT ${OBJECTDIR}/src/Application.o  -o ${OBJECTDIR}/src/Application.o src/Application.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Console.o: src/Console.cpp  .generated_files/flags/debug/f6ea16f8e77d4da1bc7d69e99a956d81b0aaf86b .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Console.o.d 
	@${RM} ${OBJECTDIR}/src/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Console.o.d" -MT "${OBJECTDIR}/src/Console.o.d" -MT ${OBJECTDIR}/src/Console.o  -o ${OBJECTDIR}/src/Console.o src/Console.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/InductanceMeter.o: src/InductanceMeter.cpp  .generated_files/flags/debug/2dc6c5744e653fdb11f9f7bc0fbc6e2103e532df .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/InductanceMeter.o.d" -MT "${OBJECTDIR}/src/InductanceMeter.o.d" -MT ${OBJECTDIR}/src/InductanceMeter.o  -o ${OBJECTDIR}/src/InductanceMeter.o src/InductanceMeter.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Interactive.o: src/Interactive.cpp  .generated_files/flags/debug/5836208f2cd4c6fa110cfc88afb7c7b699a9eb14 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interactive.o.d 
	@${RM} ${OBJECTDIR}/src/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Interactive.o.d" -MT "${OBJECTDIR}/src/Interactive.o.d" -MT ${OBJECTDIR}/src/Interactive.o  -o ${OBJECTDIR}/src/Interactive.o src/Interactive.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/main.o: src/main.cpp  .generated_files/flags/debug/5d3a7098443eaa3a2c78b2420792203cf65f48dd .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/main.o.d" -MT "${OBJECTDIR}/src/main.o.d" -MT ${OBJECTDIR}/src/main.o  -o ${OBJECTDIR}/src/main.o src/main.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-static -Wl,-u,vfprintf -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1 -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-static -Wl,-u,vfprintf -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/debug
	${RM} -r dist/debug

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
