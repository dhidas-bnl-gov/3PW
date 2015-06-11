#!../../bin/linux-x86_64/ThreePW

## You may have to change ThreePW to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}


# Set epics env variables
epicsEnvSet("sys", "SR:C99-ID:G1")
epicsEnvSet("dev", "3PW:1")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/protocols")

## Register all support components
dbLoadDatabase("dbd/ThreePW.dbd")
#dbLoadDatabase("/usr/lib/epics/dbd/sCalcoutRecord.dbd")
ThreePW_registerRecordDeviceDriver pdbbase


# TCP/IP conection for Motor Controller
#pmacAsynIPConfigure("LAN0", "192.6.94.5:1025")
pmacAsynIPConfigure("LAN0", "192.168.1.12:1025")
#pmacAsynIPConfigure("LAN0", "192.168.1.13:1025")

#pmacAsynMotorCreate("LAN0", 0, 0, 1)
pmacSetIdlePollPeriod(0, 500)
pmacSetMovingPollPeriod(0, 200)

pmacAsynCoordCreate("pmac0", 0, 2, 12, 10)
drvAsynMotorConfigure("BRICK1CS2", "pmacAsynCoord", 12, 1)



## Load record instances
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV=$(dev),AXIS=1,PORT=LAN0")
dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV=$(dev),AXIS=1,PORT=LAN0")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=rootHost"
