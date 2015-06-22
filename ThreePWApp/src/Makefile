TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

#LIBRARY_IOC += ThreePWSupport


# Compile and add the code to the support library
#ThreePWSupport_SRCS += .c


#ThreePWSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = ThreePW
# ThreePW.dbd will be created and installed
DBD += ThreePW.dbd

# ThreePW.dbd will be made up from these files:
#ThreePW_DBD += pmacUtilSupport.dbd
#ThreePW_DBD += errorHandling.dbd
#ThreePW_DBD += lookupTables.dbd
#ThreePW_DBD += mps.dbd
#ThreePW_DBD += sncMove.dbd
#ThreePW_DBD += sncOpMode.dbd
#ThreePW_DBD += mks937b.dbd
#ThreePW_DBD += epsilon.dbd
#ThreePW_DBD += beckhoff.dbd

ThreePW_DBD += base.dbd
ThreePW_DBD += asyn.dbd
ThreePW_DBD += stream.dbd
ThreePW_DBD += pmacAsynMotor.dbd
ThreePW_DBD += pmacAsynIPPort.dbd
ThreePW_DBD += pmacAsynCoord.dbd

#ThreePW_DBD += sCalcoutRecord.dbd
ThreePW_DBD += busyRecord.dbd
#ThreePW_DBD += dbCommon.dbd
ThreePW_DBD += motorSupport.dbd
#ThreePW_DBD += motorSimSupport.dbd
ThreePW_DBD += devSoftMotor.dbd
#ThreePW_DBD += system.dbd
#ThreePW_DBD += devIocStats.dbd
#ThreePW_DBD += asSupport.dbd
#ThreePW_DBD += caPutLog.dbd

# ThreePW_registerRecordDeviceDriver.cpp derives from ThreePW.dbd
ThreePW_SRCS += ThreePW_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ThreePW_SRCS_DEFAULT += ThreePWMain.cpp
ThreePW_SRCS_vxWorks += -nil-


# Link in the code from the support library
ThreePW_LIBS += asyn
ThreePW_LIBS += motor
ThreePW_LIBS += softMotor
#ThreePW_LIBS += motorSimSupport
ThreePW_LIBS += pmacAsynCoord
ThreePW_LIBS += pmacAsynIPPort
ThreePW_LIBS += pmacAsynMotor
ThreePW_LIBS += stream
#ThreePW_LIBS += calc
#ThreePW_LIBS += autosave
ThreePW_LIBS += busy
ThreePW_LIBS += seq pv

#ThreePW_LIBS += devIocStats
#ThreePW_LIBS += caPutLog

#ThreePW_LIBS += ThreePWSupport
#ThreePW_LIBS += pmacAsynCoord
#ThreePW_LIBS += pmacAsynIPPort
#ThreePW_LIBS += pmacAsynMotorPort
#ThreePW_LIBS += pmacAsynMotor
#ThreePW_LIBS += asIoc
#ThreePW_LIBS += motor
#ThreePW_LIBS += stream
#ThreePW_LIBS += seq pv




# Finally link to the EPICS Base libraries
ThreePW_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

