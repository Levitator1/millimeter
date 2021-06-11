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
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/debug/d229941e1ec8aa8b0b8e57d7ad06e3e9dfaff35f .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/debug/26b202377edb7270a0558488ec6c86fd656d8592 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/debug/4470462443a0bd67f43b066eb50756f000289904 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/debug/1e8f19f44d3d15346087dd4ba54ee9be0ac8ac33 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/debug/4448848d298723bb1f0cbef1922aca6e128eaac1 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/debug/a0d85193243ff700506f5232f84b2a6d823eb1b8 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/debug/97dfd7b064f3ae0360e17c6f3b952fbdc9f43379 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/debug/4ece19b33b01447e038e3c9b51d319680b03d90e .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/debug/c6a40bdd7d1673dcab4bf5a9d44a542f7c45ad39 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/debug/ebdccafdf53f2d093131226f6a994cee7b5db478 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/debug/8d406b05bd62b26fbdd177350245db8a5117d92 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/debug/fa9dd3254d61215ea7e378c325ecb38933865c0 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/debug/f5468578b76f4160e59022cd489ae099a154e35c .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/debug/d62ce9432dc8f6e7bc9f80f6fbd6095a8bfae32e .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/cplusplus.o: cplusplus.cpp  .generated_files/flags/debug/7fbcbad8cfd06502f6957d53f9d92da112ff4c7d .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/cplusplus.o.d" -MT "${OBJECTDIR}/cplusplus.o.d" -MT ${OBJECTDIR}/cplusplus.o  -o ${OBJECTDIR}/cplusplus.o cplusplus.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
else
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/debug/edf2cff282208d110dbb37da279000d9280876e3 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/debug/b2bf7038d66326f7c11f875b9d0a917f72592cac .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/debug/dc7b6e1135eaf62ec62a191a591f937165f669a8 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/debug/b59fee4debb5c47c2f0922f64bc8cbb0f120c5b6 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/debug/ee7b72b4bb2dfa96c0bc5ab080d97c3be79e1e84 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/debug/b757dd55662bf86f9f76d0d9e432b354824e8e2 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/debug/47454f5a5d20c4cbbf710674132f696c13fe1d15 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/debug/f90ad5d783426fe3a01ac93dadcf7da1f3afe0e9 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/debug/3cf77ecad4a209ad7466da8332e7c8df87e1e743 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/debug/2bd6f45e438b1f1d75dcdba0cd486d7da889ddc0 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/debug/2b52df3b15379adf2098cf22ef93669c6d5ba5b0 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/debug/de7c9cea6f60236f40450d7ff8d0f214ddeaae02 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/debug/39efc83728a75d3d5041e071cd42a0c9cbafef56 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/debug/9d8f7109d2016fea5b1904d9458b7cc0a0bff7c1 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/cplusplus.o: cplusplus.cpp  .generated_files/flags/debug/25a3af32acbe0f0f6bc4ce3c253443aa6f23754 .generated_files/flags/debug/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O0 -Wall -MD -MP -MF "${OBJECTDIR}/cplusplus.o.d" -MT "${OBJECTDIR}/cplusplus.o.d" -MT ${OBJECTDIR}/cplusplus.o  -o ${OBJECTDIR}/cplusplus.o cplusplus.cpp  -DXPRJ_debug=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
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
