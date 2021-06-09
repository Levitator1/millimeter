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
SOURCEFILES_QUOTED_IF_SPACED=AnalogComparator.cpp Application.cpp CommandHandler.cpp Console.cpp HWTimerCommon.cpp HWTimer_atmega328p.cpp InductanceMeter.cpp Interactive.cpp LevSerial.cpp MeasureInductance.cpp UnknownCommand.cpp atomic.cpp main.cpp util.cpp

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/AnalogComparator.o ${OBJECTDIR}/Application.o ${OBJECTDIR}/CommandHandler.o ${OBJECTDIR}/Console.o ${OBJECTDIR}/HWTimerCommon.o ${OBJECTDIR}/HWTimer_atmega328p.o ${OBJECTDIR}/InductanceMeter.o ${OBJECTDIR}/Interactive.o ${OBJECTDIR}/LevSerial.o ${OBJECTDIR}/MeasureInductance.o ${OBJECTDIR}/UnknownCommand.o ${OBJECTDIR}/atomic.o ${OBJECTDIR}/main.o ${OBJECTDIR}/util.o
POSSIBLE_DEPFILES=${OBJECTDIR}/AnalogComparator.o.d ${OBJECTDIR}/Application.o.d ${OBJECTDIR}/CommandHandler.o.d ${OBJECTDIR}/Console.o.d ${OBJECTDIR}/HWTimerCommon.o.d ${OBJECTDIR}/HWTimer_atmega328p.o.d ${OBJECTDIR}/InductanceMeter.o.d ${OBJECTDIR}/Interactive.o.d ${OBJECTDIR}/LevSerial.o.d ${OBJECTDIR}/MeasureInductance.o.d ${OBJECTDIR}/UnknownCommand.o.d ${OBJECTDIR}/atomic.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/util.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/AnalogComparator.o ${OBJECTDIR}/Application.o ${OBJECTDIR}/CommandHandler.o ${OBJECTDIR}/Console.o ${OBJECTDIR}/HWTimerCommon.o ${OBJECTDIR}/HWTimer_atmega328p.o ${OBJECTDIR}/InductanceMeter.o ${OBJECTDIR}/Interactive.o ${OBJECTDIR}/LevSerial.o ${OBJECTDIR}/MeasureInductance.o ${OBJECTDIR}/UnknownCommand.o ${OBJECTDIR}/atomic.o ${OBJECTDIR}/main.o ${OBJECTDIR}/util.o

# Source Files
SOURCEFILES=AnalogComparator.cpp Application.cpp CommandHandler.cpp Console.cpp HWTimerCommon.cpp HWTimer_atmega328p.cpp InductanceMeter.cpp Interactive.cpp LevSerial.cpp MeasureInductance.cpp UnknownCommand.cpp atomic.cpp main.cpp util.cpp

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
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/default/65d632420fbcf731a1f63e64bba2415fd7c7dd08 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/default/e40f588bd0826d03c9e75aed216af2ffab30b59e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/default/98ea545997de1cdf9fb547b4105db2b88d7dae1e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/default/127fad79da9f863854ab56ed58f327a236209f1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/default/d5f4c3c20a05964f7d42b011ee8453516f5d1f9 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/default/ea2a5ef4633184c3f5e88a6865aa9b5474f50ee1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/default/48cb62ee203270258b36fed3e6730ee83d622434 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/default/8e5b9570871013e340aff0eebb8604db5622e524 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/default/de3dcc7e03d9236374233c7f9136bd24086a977b .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/default/f496fed2a25bc37869d999de785ffd3e8b89bbc3 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/default/fcd44a85fef62a72092620a1da0eaac9add6cc4f .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/default/54180419f01e528d6cf51f9919d56d21e683c80b .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/default/b851e7a0ea688aa020c70c45d8cef2bb699a73e2 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/default/eaca679cc6b35399feb93eea7180a14fffb3951d .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
else
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/default/924da6a3cf003a2eb0d94bba3aa1e54baf78dac .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/default/356043c12df5182a14589dae7089c4294a3308ac .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/default/9b7385e783d1c4923da204538e316746804bb048 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/default/64079e14260ffbb792bed64f0d19ab2513624bfb .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/default/c19770ce4441052b5430adb1488fa85c90538df0 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/default/d33e5a27fc1fa6ad85fbe023ae73b25e722be276 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/default/51ce251030ca7d0119e19e6fc1bf4b27f868db3e .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/default/91e6f518bc63f8d985a531a992cdcd9f9097769b .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/default/c9e4318a7e5bd471b5f1a9e8ee1b3fafc439bd03 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/default/b274e580d27329b9af8a8a72871cbfbe97220ad .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/default/d956ac5b4d0e9b6aaec2cda0c0c28293d6e18784 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/default/10bc9203a3ee8f211c35c0d4578ef201221b7830 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/default/eca3638fc929666a77ac7bd9998092e2b6f76fee .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/default/f6f5bad1075aaf4dfbdba7d3439ca7f1b6f18734 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c++17
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}   -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/millimeter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
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
