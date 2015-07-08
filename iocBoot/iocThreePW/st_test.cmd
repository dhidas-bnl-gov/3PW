#!../../bin/linux-x86_64/ThreePW

< envPaths
cd ${TOP}


# Set epics env variables
epicsEnvSet("ENGINEER", "Dean Andrew Hidas is not an engineer. <dhidas@bnl.gov>")
epicsEnvSet("PMACUTIL", "/usr/share/epics-pmacutil-dev")
epicsEnvSet("PMAC1_IP", "192.168.1.12:1025")
epicsEnvSet("sys", "SR:C99-ID:G1")
epicsEnvSet("dev", "3PW:1")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/protocols")



## Register all support components
dbLoadDatabase("dbd/ThreePW.dbd")
ThreePW_registerRecordDeviceDriver pdbbase











pmacAsynIPConfigure("P0", $(PMAC1_IP))
pmacAsynMotorCreate("P0", 0, 0, 1)
drvAsynMotorConfigure("PMAC1", "pmacAsynMotor", 1, 2)
pmacSetIdlePollPeriod(0, 500)
pmacSetMovingPollPeriod(0, 200)
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)},AXIS=1,PORT=P0")





cd ${TOP}/iocBoot/${IOC}
iocInit
#exit
