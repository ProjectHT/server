#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/MyObject.o \
	${OBJECTDIR}/main.o


# C Compiler Flags
CFLAGS=-m64

# CC Compiler Flags
CCFLAGS=-m64
CXXFLAGS=-m64

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib -lpthread -ldl `pkg-config --libs opencv` `pkg-config --libs openssl` `pkg-config --libs libavcodec-ffmpeg` `pkg-config --libs libavformat-ffmpeg` `pkg-config --libs libavutil-ffmpeg` `pkg-config --libs libcrypto` `pkg-config --libs libswresample-ffmpeg` `pkg-config --libs libswscale-ffmpeg` -lboost_atomic -lboost_chrono -lboost_container -lboost_context -lboost_contract -lboost_coroutine -lboost_date_time -lboost_filesystem -lboost_graph -lboost_iostreams -lboost_locale -lboost_log -lboost_log_setup -lboost_math_c99 -lboost_math_c99f -lboost_math_c99l -lboost_math_tr1 -lboost_math_tr1f -lboost_math_tr1l -lboost_prg_exec_monitor -lboost_program_options -lboost_python27 -lboost_random -lboost_regex -lboost_serialization -lboost_signals -lboost_stacktrace_addr2line -lboost_stacktrace_backtrace -lboost_stacktrace_basic -lboost_stacktrace_noop -lboost_system -lboost_thread -lboost_timer -lboost_type_erasure -lboost_unit_test_framework -lboost_wave -lboost_wserialization  

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myserver

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myserver: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myserver ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/MyObject.o: MyObject.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -I/usr/local/include `pkg-config --cflags opencv` `pkg-config --cflags openssl` `pkg-config --cflags libavcodec-ffmpeg` `pkg-config --cflags libavformat-ffmpeg` `pkg-config --cflags libavutil-ffmpeg` `pkg-config --cflags libcrypto` `pkg-config --cflags libswresample-ffmpeg` `pkg-config --cflags libswscale-ffmpeg` -std=c++14  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MyObject.o MyObject.cpp

${OBJECTDIR}/main.o: main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -I/usr/local/include `pkg-config --cflags opencv` `pkg-config --cflags openssl` `pkg-config --cflags libavcodec-ffmpeg` `pkg-config --cflags libavformat-ffmpeg` `pkg-config --cflags libavutil-ffmpeg` `pkg-config --cflags libcrypto` `pkg-config --cflags libswresample-ffmpeg` `pkg-config --cflags libswscale-ffmpeg` -std=c++14  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
