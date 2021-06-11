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
SOURCEFILES_QUOTED_IF_SPACED=AnalogComparator.cpp Application.cpp CommandHandler.cpp Console.cpp HWTimerCommon.cpp HWTimer_atmega328p.cpp InductanceMeter.cpp Interactive.cpp LevSerial.cpp MeasureInductance.cpp UnknownCommand.cpp atomic.cpp main.cpp util.cpp cplusplus.cpp

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/AnalogComparator.o ${OBJECTDIR}/Application.o ${OBJECTDIR}/CommandHandler.o ${OBJECTDIR}/Console.o ${OBJECTDIR}/HWTimerCommon.o ${OBJECTDIR}/HWTimer_atmega328p.o ${OBJECTDIR}/InductanceMeter.o ${OBJECTDIR}/Interactive.o ${OBJECTDIR}/LevSerial.o ${OBJECTDIR}/MeasureInductance.o ${OBJECTDIR}/UnknownCommand.o ${OBJECTDIR}/atomic.o ${OBJECTDIR}/main.o ${OBJECTDIR}/util.o ${OBJECTDIR}/cplusplus.o
POSSIBLE_DEPFILES=${OBJECTDIR}/AnalogComparator.o.d ${OBJECTDIR}/Application.o.d ${OBJECTDIR}/CommandHandler.o.d ${OBJECTDIR}/Console.o.d ${OBJECTDIR}/HWTimerCommon.o.d ${OBJECTDIR}/HWTimer_atmega328p.o.d ${OBJECTDIR}/InductanceMeter.o.d ${OBJECTDIR}/Interactive.o.d ${OBJECTDIR}/LevSerial.o.d ${OBJECTDIR}/MeasureInductance.o.d ${OBJECTDIR}/UnknownCommand.o.d ${OBJECTDIR}/atomic.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/util.o.d ${OBJECTDIR}/cplusplus.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/AnalogComparator.o ${OBJECTDIR}/Application.o ${OBJECTDIR}/CommandHandler.o ${OBJECTDIR}/Console.o ${OBJECTDIR}/HWTimerCommon.o ${OBJECTDIR}/HWTimer_atmega328p.o ${OBJECTDIR}/InductanceMeter.o ${OBJECTDIR}/Interactive.o ${OBJECTDIR}/LevSerial.o ${OBJECTDIR}/MeasureInductance.o ${OBJECTDIR}/UnknownCommand.o ${OBJECTDIR}/atomic.o ${OBJECTDIR}/main.o ${OBJECTDIR}/util.o ${OBJECTDIR}/cplusplus.o

# Source Files
SOURCEFILES=AnalogComparator.cpp Application.cpp CommandHandler.cpp Console.cpp HWTimerCommon.cpp HWTimer_atmega328p.cpp InductanceMeter.cpp Interactive.cpp LevSerial.cpp MeasureInductance.cpp UnknownCommand.cpp atomic.cpp main.cpp util.cpp cplusplus.cpp

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
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/debug/bb7ff902231a76cfa2fe27935acf78d557acbd3a .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/debug/9d2de1920488d00779f554adf0a61490efa5b530 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/debug/de2dc69646fc78ffd2e3c4f5253160a6eca918ff .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/debug/7dd38bdac6b874c64294d512f3e2d16ad52a6d51 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/debug/781bb7fbfb998afcf8fc3797cd86c1d00f2a38b2 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/debug/56f9e57e41ffe73a2ad450a549559c49397f50c7 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/debug/e408c8fe9c5f11b4779d9ea5ae3d65a0d476a56e .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/debug/1013cc21baf0e7bfd271a015f4344c515a5eda .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/debug/59f6b66073b805a6ee7a015fa2b58105b7d823f4 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/debug/2e59169afc5c75f5207038731489e4cf57730e6a .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/debug/31e68dc6c615b03aaff23f5d473378362e3c979c .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/debug/f818de64e8942bdde9f377c1b35628031949e5f .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/debug/cd3da56a7c63350e6ba5bbd2f9d9eb6886684636 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/debug/4d759ffdb5b7d48a36d94e0903aa300853747b44 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/cplusplus.o: cplusplus.cpp  .generated_files/flags/debug/6700d137a3685162a84cf84a2fcafcf65b93f731 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/cplusplus.o.d" -MT "${OBJECTDIR}/cplusplus.o.d" -MT ${OBJECTDIR}/cplusplus.o  -o ${OBJECTDIR}/cplusplus.o cplusplus.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
else
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/debug/e27f04292d1ff994bd5feabeaf246def0d91e941 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/debug/b0afcd2fce92dcb86889c397d17339fee71ba4d6 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/debug/488443d70ac3e5cca684a2c8867bdea4dce37abb .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/debug/c0e07207d08e6d26a12322f8ff3524e582e0f789 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/debug/3f29cda9f95f240c1a3aa4ad91a037a54a31b136 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/debug/284e7b021389f79db60cb780d3146a74d7187b83 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/debug/29d656bd21563dbc5f93f1f86e42a841e43e3c47 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/debug/da3d72241cebb3c5aa906bf7f677ea7dafd38442 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/debug/646dca4dcba3eb451f8790751d0f984171e46854 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/debug/4d578968c207dc2db0f7e75ef76b57ce64ac5277 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/debug/151ceee53cb710eba3690b700d706a82199c974f .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/debug/c1ab49c188b0ff7526b978e5baa914c49807448 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/debug/cd09288867bbd5ee446f0c521275297f82a9f96c .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/debug/843a8648b91feb6cca228ff508a9176df0a85333 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/cplusplus.o: cplusplus.cpp  .generated_files/flags/debug/a4784964219e4b4cb8c1e85aa5a59c9b3ebba5de .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/cplusplus.o.d" -MT "${OBJECTDIR}/cplusplus.o.d" -MT ${OBJECTDIR}/cplusplus.o  -o ${OBJECTDIR}/cplusplus.o cplusplus.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-static -Wl,-u,vfprintf -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-static -Wl,-u,vfprintf -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
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
