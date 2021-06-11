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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/default/2f3555d234b10955c5d0a7191b9f713b0e119e1e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/default/44c3fac0b8937222a2f1585472017b7103844df5 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/default/e8c05ec093b037b7276963827681743c9af934f1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/default/ceee5960b97471e57fa872bda65d02ace4977c88 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/default/dad142b1da0928198863061c517269d6eb7cc2b5 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/default/94f4a77e4385dc928bbd9abea39c1c2305d941c6 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/default/a6eb649236db2b4721a2316ae5dbfbf9e4046709 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/default/e3b1b118f34762f885375fe0976528720c5e37ef .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/default/38e1a26b501af8ffa63105ab3877ce7f13d5beab .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/default/53fbb9e2e993e09ca9e604b8b3da0841eef29c96 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/default/7a9807cd239ae6682e7220706dc7de9cdc59262a .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/default/71b8d6a01b000a9a20308d36e6e1b2a85aeadf22 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/default/308c8597e2210ee7e10013093f4134c6bb3ca791 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/default/d38e26249c981a8b560e6adcd765f232ae9ee7f6 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/cplusplus.o: cplusplus.cpp  .generated_files/flags/default/7eb95d27667e333923c19853d60a581282fd0c08 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/cplusplus.o.d" -MT "${OBJECTDIR}/cplusplus.o.d" -MT ${OBJECTDIR}/cplusplus.o  -o ${OBJECTDIR}/cplusplus.o cplusplus.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
else
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/default/13f49aa02279ff4b7d01b0fb2f536b3759f508bd .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/default/e67c44e52a210187579d9a0f7bdd25c12ad73103 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/default/65978b9b2822a97a99db5dfbbe7330a44fdc2826 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/default/89b713f4988104325eedd1d4bcf5a16781a9909b .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/default/49970fc24f8c0c2b540b758ece2956f171943f4a .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/default/6bb9d6e153a4739753f51160ff76360a6d68553a .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/default/79c276592cd6ec9e19b2c624d5aba7b1e330a34c .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/default/2539156dbdf29569c9e2f64bbf69c341d347d72a .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/default/1af2417389c9e9eaffcac943c6c311ee798d41f3 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/default/6bc8ba6c2bd3a3548919df632d2a58bd3925662d .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/default/1de9f10ac1fc982483308e54829d4d6e713243b0 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/default/ca5008f87023e70d8096e00c04471b69901e4fd4 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/default/e98527b96b54a3f6e049efa3af240e9f4933cd58 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/default/56b08b56782baa636b63bd77a0b9e32f9c3ccc1a .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
${OBJECTDIR}/cplusplus.o: cplusplus.cpp  .generated_files/flags/default/51403698bf755aefa928a251ed3be913861d0dbb .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cplusplus.o.d 
	@${RM} ${OBJECTDIR}/cplusplus.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/cplusplus.o.d" -MT "${OBJECTDIR}/cplusplus.o.d" -MT ${OBJECTDIR}/cplusplus.o  -o ${OBJECTDIR}/cplusplus.o cplusplus.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17 -DARDUINO_PRO_MINI3_3V
	
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
