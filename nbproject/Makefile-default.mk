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
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/default/e9e7b631972885d2fcfd0a873f9c5b703e7b559 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/default/732bb0e04259c9214e112317f81ce45dc20c3bf3 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/default/90d22263d08ac4dc076d98686f435a4bff55c802 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/default/d8999db97ca4882f3114be7268232899dcec72a0 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/default/25a39c9c6877ed2539782b29ceafeed15542ffc7 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/default/637d64d14f8d90cfa2e6110537a9c3de2aca0c15 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/default/55b25d034078d6c14954b78cc1f5579033dc3ea0 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/default/760eb59aab4c354d8984e4deec97439cb43b3f41 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/default/16d6ea976a6a7afe663e6300fc6da5fac830fefd .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/default/be457f1870fe0999a47dd9f3d3111c77c89b85e0 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/default/58c7da6aa3a5a516322bf9c346d89fe023cd68b9 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/default/5ae3aa71c677ae707687c5a34494e46a197ab8eb .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/default/e0b0b07cf9c242ff73a02f156d8d538df72dd48d .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/default/393fce6b7d9b97e45fa26b9e07fcceba1dd79f52 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/AnalogComparator.o: AnalogComparator.cpp  .generated_files/flags/default/3c719580707d85fa8752a2c1a0c02250de0a1650 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/AnalogComparator.o.d 
	@${RM} ${OBJECTDIR}/AnalogComparator.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/AnalogComparator.o.d" -MT "${OBJECTDIR}/AnalogComparator.o.d" -MT ${OBJECTDIR}/AnalogComparator.o  -o ${OBJECTDIR}/AnalogComparator.o AnalogComparator.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Application.o: Application.cpp  .generated_files/flags/default/cce13f8b43ffb8bc139caeb8e9e67c7ccc4056e1 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Application.o.d 
	@${RM} ${OBJECTDIR}/Application.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Application.o.d" -MT "${OBJECTDIR}/Application.o.d" -MT ${OBJECTDIR}/Application.o  -o ${OBJECTDIR}/Application.o Application.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/CommandHandler.o: CommandHandler.cpp  .generated_files/flags/default/49307e239aa0579e54dcc687d6e1792f70f0b41d .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/CommandHandler.o.d 
	@${RM} ${OBJECTDIR}/CommandHandler.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/CommandHandler.o.d" -MT "${OBJECTDIR}/CommandHandler.o.d" -MT ${OBJECTDIR}/CommandHandler.o  -o ${OBJECTDIR}/CommandHandler.o CommandHandler.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Console.o: Console.cpp  .generated_files/flags/default/3643f74961283713a6c81965bc402804d1899820 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Console.o.d 
	@${RM} ${OBJECTDIR}/Console.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Console.o.d" -MT "${OBJECTDIR}/Console.o.d" -MT ${OBJECTDIR}/Console.o  -o ${OBJECTDIR}/Console.o Console.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/HWTimerCommon.o: HWTimerCommon.cpp  .generated_files/flags/default/200e57fb1560c34c920494bb39f1bb3da65acf3 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o.d 
	@${RM} ${OBJECTDIR}/HWTimerCommon.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimerCommon.o.d" -MT "${OBJECTDIR}/HWTimerCommon.o.d" -MT ${OBJECTDIR}/HWTimerCommon.o  -o ${OBJECTDIR}/HWTimerCommon.o HWTimerCommon.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/HWTimer_atmega328p.o: HWTimer_atmega328p.cpp  .generated_files/flags/default/3704156e7f743bbd79632624ec57580d5726a1df .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o.d 
	@${RM} ${OBJECTDIR}/HWTimer_atmega328p.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT "${OBJECTDIR}/HWTimer_atmega328p.o.d" -MT ${OBJECTDIR}/HWTimer_atmega328p.o  -o ${OBJECTDIR}/HWTimer_atmega328p.o HWTimer_atmega328p.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/InductanceMeter.o: InductanceMeter.cpp  .generated_files/flags/default/637a01a11e66d44420e0f5876082853d532fb54c .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InductanceMeter.o.d 
	@${RM} ${OBJECTDIR}/InductanceMeter.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/InductanceMeter.o.d" -MT "${OBJECTDIR}/InductanceMeter.o.d" -MT ${OBJECTDIR}/InductanceMeter.o  -o ${OBJECTDIR}/InductanceMeter.o InductanceMeter.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Interactive.o: Interactive.cpp  .generated_files/flags/default/98d77e45adecf7dd91092d6a65424b964d521963 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Interactive.o.d 
	@${RM} ${OBJECTDIR}/Interactive.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Interactive.o.d" -MT "${OBJECTDIR}/Interactive.o.d" -MT ${OBJECTDIR}/Interactive.o  -o ${OBJECTDIR}/Interactive.o Interactive.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/LevSerial.o: LevSerial.cpp  .generated_files/flags/default/2e97281ae485b1642116d7ee83013a7a39024f43 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LevSerial.o.d 
	@${RM} ${OBJECTDIR}/LevSerial.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/LevSerial.o.d" -MT "${OBJECTDIR}/LevSerial.o.d" -MT ${OBJECTDIR}/LevSerial.o  -o ${OBJECTDIR}/LevSerial.o LevSerial.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MeasureInductance.o: MeasureInductance.cpp  .generated_files/flags/default/eed4a692c2377f797c5f2a7d6d5321dc42d16695 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MeasureInductance.o.d 
	@${RM} ${OBJECTDIR}/MeasureInductance.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MeasureInductance.o.d" -MT "${OBJECTDIR}/MeasureInductance.o.d" -MT ${OBJECTDIR}/MeasureInductance.o  -o ${OBJECTDIR}/MeasureInductance.o MeasureInductance.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/UnknownCommand.o: UnknownCommand.cpp  .generated_files/flags/default/1f89db094f51d52de7761ac5860984d6bdc968fc .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnknownCommand.o.d 
	@${RM} ${OBJECTDIR}/UnknownCommand.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/UnknownCommand.o.d" -MT "${OBJECTDIR}/UnknownCommand.o.d" -MT ${OBJECTDIR}/UnknownCommand.o  -o ${OBJECTDIR}/UnknownCommand.o UnknownCommand.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/atomic.o: atomic.cpp  .generated_files/flags/default/25489d421e5038862f44cf181825264e8d2d3127 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/atomic.o.d 
	@${RM} ${OBJECTDIR}/atomic.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/atomic.o.d" -MT "${OBJECTDIR}/atomic.o.d" -MT ${OBJECTDIR}/atomic.o  -o ${OBJECTDIR}/atomic.o atomic.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.cpp  .generated_files/flags/default/6f546e23b62f7d5d58231aea02fe60686be7d330 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/util.o: util.cpp  .generated_files/flags/default/681c7d4f531a9098d902055366be7296f4eed802 .generated_files/flags/default/8fff49d0cb05b727cea9f8f21beb379e9251bb92
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/util.o.d 
	@${RM} ${OBJECTDIR}/util.o 
	 ${MP_CPPC} $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c++ -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/util.o.d" -MT "${OBJECTDIR}/util.o.d" -MT ${OBJECTDIR}/util.o  -o ${OBJECTDIR}/util.o util.cpp  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
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
