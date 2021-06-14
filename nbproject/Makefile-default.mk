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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
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
SOURCEFILES_QUOTED_IF_SPACED=src/avr/atmega328o/HWTimer_atmega328p.cpp src/util/atomic.cpp src/avr/system.c src/command_handlers/UnknownCommand.cpp src/command_handlers/MeasureInductance.cpp src/command_handlers/CommandHandler.cpp src/command_handlers/RebootCommand.cpp src/util/util.cpp src/util/cplusplus.cpp src/Application.cpp src/Console.cpp src/InductanceMeter.cpp src/Interactive.cpp src/main.cpp

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o ${OBJECTDIR}/src/util/atomic.o ${OBJECTDIR}/src/avr/system.o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o ${OBJECTDIR}/src/command_handlers/CommandHandler.o ${OBJECTDIR}/src/command_handlers/RebootCommand.o ${OBJECTDIR}/src/util/util.o ${OBJECTDIR}/src/util/cplusplus.o ${OBJECTDIR}/src/Application.o ${OBJECTDIR}/src/Console.o ${OBJECTDIR}/src/InductanceMeter.o ${OBJECTDIR}/src/Interactive.o ${OBJECTDIR}/src/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d ${OBJECTDIR}/src/util/atomic.o.d ${OBJECTDIR}/src/avr/system.o.d ${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d ${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d ${OBJECTDIR}/src/command_handlers/CommandHandler.o.d ${OBJECTDIR}/src/command_handlers/RebootCommand.o.d ${OBJECTDIR}/src/util/util.o.d ${OBJECTDIR}/src/util/cplusplus.o.d ${OBJECTDIR}/src/Application.o.d ${OBJECTDIR}/src/Console.o.d ${OBJECTDIR}/src/InductanceMeter.o.d ${OBJECTDIR}/src/Interactive.o.d ${OBJECTDIR}/src/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o ${OBJECTDIR}/src/util/atomic.o ${OBJECTDIR}/src/avr/system.o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o ${OBJECTDIR}/src/command_handlers/CommandHandler.o ${OBJECTDIR}/src/command_handlers/RebootCommand.o ${OBJECTDIR}/src/util/util.o ${OBJECTDIR}/src/util/cplusplus.o ${OBJECTDIR}/src/Application.o ${OBJECTDIR}/src/Console.o ${OBJECTDIR}/src/InductanceMeter.o ${OBJECTDIR}/src/Interactive.o ${OBJECTDIR}/src/main.o

# Source Files
SOURCEFILES=src/avr/atmega328o/HWTimer_atmega328p.cpp src/util/atomic.cpp src/avr/system.c src/command_handlers/UnknownCommand.cpp src/command_handlers/MeasureInductance.cpp src/command_handlers/CommandHandler.cpp src/command_handlers/RebootCommand.cpp src/util/util.cpp src/util/cplusplus.cpp src/Application.cpp src/Console.cpp src/InductanceMeter.cpp src/Interactive.cpp src/main.cpp

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

# The following macros may be used in the pre and post step lines
_/_=/
ShExtension=.sh
Device=ATmega328P
ProjectDir=/home/j/project/millimeter
ProjectName=millimeter
ConfName=default
ImagePath=dist/default/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
ImageDir=dist/default/${IMAGE_TYPE}
ImageName=millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [avr-size -C --totals --mcu=`echo "${Device}" | tr '[:upper:]' '[:lower:]'` dist/default/production/millimeter.production.elf]"
	@avr-size -C --totals --mcu=`echo "${Device}" | tr '[:upper:]' '[:lower:]'` dist/default/production/millimeter.production.elf
	@echo "--------------------------------------"

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
${OBJECTDIR}/src/avr/system.o: src/avr/system.c  .generated_files/flags/default/b8d8b57a1f35494f20e97f1eb552e0f52fa46b32 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/avr" 
	@${RM} ${OBJECTDIR}/src/avr/system.o.d 
	@${RM} ${OBJECTDIR}/src/avr/system.o 
	 ${MP_CPPC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums  -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/avr/system.o.d" -MT "${OBJECTDIR}/src/avr/system.o.d" -MT ${OBJECTDIR}/src/avr/system.o  -o ${OBJECTDIR}/src/avr/system.o src/avr/system.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/src/avr/system.o: src/avr/system.c  .generated_files/flags/default/211821d9f5b846f4ec3a315ef5a98cdf68af44b1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/avr" 
	@${RM} ${OBJECTDIR}/src/avr/system.o.d 
	@${RM} ${OBJECTDIR}/src/avr/system.o 
	 ${MP_CPPC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums  -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/avr/system.o.d" -MT "${OBJECTDIR}/src/avr/system.o.d" -MT ${OBJECTDIR}/src/avr/system.o  -o ${OBJECTDIR}/src/avr/system.o src/avr/system.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o: src/avr/atmega328o/HWTimer_atmega328p.cpp  .generated_files/flags/default/7302a73988376529c369e091290742688df82c1f .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/avr/atmega328o" 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o  -o ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o src/avr/atmega328o/HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/atomic.o: src/util/atomic.cpp  .generated_files/flags/default/b77f5a10e186ddde252f5b7331f91ae146fcfe8 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/atomic.o.d 
	@${RM} ${OBJECTDIR}/src/util/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/atomic.o.d" -MT "${OBJECTDIR}/src/util/atomic.o.d" -MT ${OBJECTDIR}/src/util/atomic.o  -o ${OBJECTDIR}/src/util/atomic.o src/util/atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/UnknownCommand.o: src/command_handlers/UnknownCommand.cpp  .generated_files/flags/default/846ec50b6483fafa5791259ee8bfa2fb1b93cb6e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT ${OBJECTDIR}/src/command_handlers/UnknownCommand.o  -o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o src/command_handlers/UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/MeasureInductance.o: src/command_handlers/MeasureInductance.cpp  .generated_files/flags/default/22930047d6db582ea0f177cdd44b314250633f96 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT ${OBJECTDIR}/src/command_handlers/MeasureInductance.o  -o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o src/command_handlers/MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/CommandHandler.o: src/command_handlers/CommandHandler.cpp  .generated_files/flags/default/78df65aeeeb0d5fa8d498dc70d9f41a657c56c45 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT ${OBJECTDIR}/src/command_handlers/CommandHandler.o  -o ${OBJECTDIR}/src/command_handlers/CommandHandler.o src/command_handlers/CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/RebootCommand.o: src/command_handlers/RebootCommand.cpp  .generated_files/flags/default/a4111a5cd02b2fff785dd8c36ea7cba9464995bf .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/RebootCommand.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/RebootCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/RebootCommand.o.d" -MT "${OBJECTDIR}/src/command_handlers/RebootCommand.o.d" -MT ${OBJECTDIR}/src/command_handlers/RebootCommand.o  -o ${OBJECTDIR}/src/command_handlers/RebootCommand.o src/command_handlers/RebootCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/util.o: src/util/util.cpp  .generated_files/flags/default/425127d23efe50d9b02125cd2956d3b89b463645 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/util.o.d 
	@${RM} ${OBJECTDIR}/src/util/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/util.o.d" -MT "${OBJECTDIR}/src/util/util.o.d" -MT ${OBJECTDIR}/src/util/util.o  -o ${OBJECTDIR}/src/util/util.o src/util/util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/cplusplus.o: src/util/cplusplus.cpp  .generated_files/flags/default/31061d3b55cc6ef2353bd0c7c058dbebf10a66e1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/cplusplus.o.d" -MT "${OBJECTDIR}/src/util/cplusplus.o.d" -MT ${OBJECTDIR}/src/util/cplusplus.o  -o ${OBJECTDIR}/src/util/cplusplus.o src/util/cplusplus.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Application.o: src/Application.cpp  .generated_files/flags/default/8e8422ac5d51570876cc8eb447be176e5100d7bb .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Application.o.d" -MT "${OBJECTDIR}/src/Application.o.d" -MT ${OBJECTDIR}/src/Application.o  -o ${OBJECTDIR}/src/Application.o src/Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Console.o: src/Console.cpp  .generated_files/flags/default/82839bc36c50c50696a7dd90c9c9d67ef7616628 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Console.o.d 
	@${RM} ${OBJECTDIR}/src/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Console.o.d" -MT "${OBJECTDIR}/src/Console.o.d" -MT ${OBJECTDIR}/src/Console.o  -o ${OBJECTDIR}/src/Console.o src/Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/InductanceMeter.o: src/InductanceMeter.cpp  .generated_files/flags/default/4b72d0ad0ffd3903ca4b549eef093f810ac28ee8 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/InductanceMeter.o.d" -MT "${OBJECTDIR}/src/InductanceMeter.o.d" -MT ${OBJECTDIR}/src/InductanceMeter.o  -o ${OBJECTDIR}/src/InductanceMeter.o src/InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Interactive.o: src/Interactive.cpp  .generated_files/flags/default/53e48143e1c72876887e4f0e62cadbaff4c87648 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interactive.o.d 
	@${RM} ${OBJECTDIR}/src/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Interactive.o.d" -MT "${OBJECTDIR}/src/Interactive.o.d" -MT ${OBJECTDIR}/src/Interactive.o  -o ${OBJECTDIR}/src/Interactive.o src/Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/main.o: src/main.cpp  .generated_files/flags/default/fd056573b02d0a99c7bbdc253c6748183c603a7e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/main.o.d" -MT "${OBJECTDIR}/src/main.o.d" -MT ${OBJECTDIR}/src/main.o  -o ${OBJECTDIR}/src/main.o src/main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
else
${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o: src/avr/atmega328o/HWTimer_atmega328p.cpp  .generated_files/flags/default/fa3806026169edad2f7972b1fd1b161c88588f9f .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/avr/atmega328o" 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o  -o ${OBJECTDIR}/src/avr/atmega328o/HWTimer_atmega328p.o src/avr/atmega328o/HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/atomic.o: src/util/atomic.cpp  .generated_files/flags/default/f9e33a431b779e19d995bf8ff63cbba2c5fbc04b .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/atomic.o.d 
	@${RM} ${OBJECTDIR}/src/util/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/atomic.o.d" -MT "${OBJECTDIR}/src/util/atomic.o.d" -MT ${OBJECTDIR}/src/util/atomic.o  -o ${OBJECTDIR}/src/util/atomic.o src/util/atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/UnknownCommand.o: src/command_handlers/UnknownCommand.cpp  .generated_files/flags/default/d1b8f48a08d71e9a5e3b0b5ca7fff5284a50ebfc .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT "${OBJECTDIR}/src/command_handlers/UnknownCommand.o.d" -MT ${OBJECTDIR}/src/command_handlers/UnknownCommand.o  -o ${OBJECTDIR}/src/command_handlers/UnknownCommand.o src/command_handlers/UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/MeasureInductance.o: src/command_handlers/MeasureInductance.cpp  .generated_files/flags/default/ab60e82f82da037ec33f00e2751f52ebf78b87f3 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT "${OBJECTDIR}/src/command_handlers/MeasureInductance.o.d" -MT ${OBJECTDIR}/src/command_handlers/MeasureInductance.o  -o ${OBJECTDIR}/src/command_handlers/MeasureInductance.o src/command_handlers/MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/CommandHandler.o: src/command_handlers/CommandHandler.cpp  .generated_files/flags/default/9f870106d9c2797f09f87e41786c5e7c1bfcb6f4 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT "${OBJECTDIR}/src/command_handlers/CommandHandler.o.d" -MT ${OBJECTDIR}/src/command_handlers/CommandHandler.o  -o ${OBJECTDIR}/src/command_handlers/CommandHandler.o src/command_handlers/CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/command_handlers/RebootCommand.o: src/command_handlers/RebootCommand.cpp  .generated_files/flags/default/11093ac9cd66fe06828f9da17e3a0933ea96990c .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/command_handlers" 
	@${RM} ${OBJECTDIR}/src/command_handlers/RebootCommand.o.d 
	@${RM} ${OBJECTDIR}/src/command_handlers/RebootCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/command_handlers/RebootCommand.o.d" -MT "${OBJECTDIR}/src/command_handlers/RebootCommand.o.d" -MT ${OBJECTDIR}/src/command_handlers/RebootCommand.o  -o ${OBJECTDIR}/src/command_handlers/RebootCommand.o src/command_handlers/RebootCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/util.o: src/util/util.cpp  .generated_files/flags/default/cf0a9a8c7904085c67a0c1a3f0c7d4e36afe107c .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/util.o.d 
	@${RM} ${OBJECTDIR}/src/util/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/util.o.d" -MT "${OBJECTDIR}/src/util/util.o.d" -MT ${OBJECTDIR}/src/util/util.o  -o ${OBJECTDIR}/src/util/util.o src/util/util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/util/cplusplus.o: src/util/cplusplus.cpp  .generated_files/flags/default/28d94fdd9747fe0bbba22e3309ae2eef1709ebd9 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src/util" 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/src/util/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/util/cplusplus.o.d" -MT "${OBJECTDIR}/src/util/cplusplus.o.d" -MT ${OBJECTDIR}/src/util/cplusplus.o  -o ${OBJECTDIR}/src/util/cplusplus.o src/util/cplusplus.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Application.o: src/Application.cpp  .generated_files/flags/default/fa7c0453c87c14bedbc1a74c03209bb9d2f14652 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Application.o.d" -MT "${OBJECTDIR}/src/Application.o.d" -MT ${OBJECTDIR}/src/Application.o  -o ${OBJECTDIR}/src/Application.o src/Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Console.o: src/Console.cpp  .generated_files/flags/default/db297819d0bd57ac0d87791043b1ba4f6db6204e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Console.o.d 
	@${RM} ${OBJECTDIR}/src/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Console.o.d" -MT "${OBJECTDIR}/src/Console.o.d" -MT ${OBJECTDIR}/src/Console.o  -o ${OBJECTDIR}/src/Console.o src/Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/InductanceMeter.o: src/InductanceMeter.cpp  .generated_files/flags/default/3aa335aeb44faaa694a36ef239da5563ff1629d2 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/src/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/InductanceMeter.o.d" -MT "${OBJECTDIR}/src/InductanceMeter.o.d" -MT ${OBJECTDIR}/src/InductanceMeter.o  -o ${OBJECTDIR}/src/InductanceMeter.o src/InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/Interactive.o: src/Interactive.cpp  .generated_files/flags/default/805d15b0ba39df6cc23fd8241a2c9681531fe9dd .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interactive.o.d 
	@${RM} ${OBJECTDIR}/src/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/Interactive.o.d" -MT "${OBJECTDIR}/src/Interactive.o.d" -MT ${OBJECTDIR}/src/Interactive.o  -o ${OBJECTDIR}/src/Interactive.o src/Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/src/main.o: src/main.cpp  .generated_files/flags/default/fc3a2b86aae20185de3ff4b5b76f0766e02ef5b1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -I "include" -Wall -MD -MP -MF "${OBJECTDIR}/src/main.o.d" -MT "${OBJECTDIR}/src/main.o.d" -MT ${OBJECTDIR}/src/main.o  -o ${OBJECTDIR}/src/main.o src/main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-s -Wl,-static -Wl,-u,vfprintf -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-s -Wl,-static -Wl,-u,vfprintf -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
