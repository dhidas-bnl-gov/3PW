#!../../bin/linux-x86_64/ThreePW

< envPaths
cd ${TOP}


# Set epics env variables
epicsEnvSet("PMAC1_IP", "192.168.1.12:1025")
epicsEnvSet("sys", "SR:C99-ID:G1")
epicsEnvSet("dev", "{3PW:1}")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/protocols")



## Register all support components
dbLoadDatabase("dbd/ThreePW.dbd")
ThreePW_registerRecordDeviceDriver pdbbase



# TCP/IP conection for Motor Controller
pmacAsynIPConfigure("PMAC1port", $(PMAC1_IP))
pmacAsynMotorCreate("PMAC1port", 0, 0, 1)
drvAsynMotorConfigure("PMAC1", "pmacAsynCoord", 12, 1)
#pmacAsynCoordCreate("PMAC1port", 0, 2, 12, 10)

pmacSetIdlePollPeriod(0, 500)
pmacSetMovingPollPeriod(0, 200)



## Load record instances
#dbLoadRecords("db/pmacStatus.db","SYS=$(sys),DEV=$(dev),AXIS=1,PORT=PMAC1port")
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV=$(dev),AXIS=1,PORT=PMAC1port")
#dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV=$(dev),SPORT=PMAC1port")



cd ${TOP}/iocBoot/${IOC}
iocInit
exit
