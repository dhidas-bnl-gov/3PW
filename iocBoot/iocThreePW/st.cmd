#!../../bin/linux-x86_64/ThreePW

< envPaths
cd ${TOP}


# Set epics env variables
epicsEnvSet("ENGINEER", "Dean Andrew Hidas is not an engineer. <dhidas@bnl.gov>")
epicsEnvSet("PMAC1_IP", "192.168.1.12:1025")
epicsEnvSet("sys", "SR:C99-ID:G1")
epicsEnvSet("dev", "3PW:1")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/protocols")



## Register all support components
dbLoadDatabase("dbd/ThreePW.dbd")
ThreePW_registerRecordDeviceDriver pdbbase



# TCP/IP conection for Motor Controller
pmacAsynIPConfigure("P0", $(PMAC1_IP))
#pmacCreateController("M0", "P0", 0, 1, 100, 1000)
#pmacCreateAxis("M0", 1)
#pmacSetAxisScale("M0", 1, 1)

pmacAsynMotorCreate("P0", 0, 0, 1)
drvAsynMotorConfigure("M0", "pmacAsynMotor", 0, 2)
#pmacAsynCoordCreate("P0", 0, 2, 12, 10)

pmacSetIdlePollPeriod(0, 500)
pmacSetMovingPollPeriod(0, 200)



## Load record instances
#dbLoadRecords("db/motor.db","P=$(sys),M={$(dev)},MOTOR=M0,PORT=P0,ADDR=1,DESC=mymoter,DTYP=asynMotor,MRES=2e-05,EGU=mm,PREC=5")
#dbLoadRecords("db/motorstatus.db","SYS=$(sys),DEV={$(dev)},PORT=P0,AXIS=1")
#dbLoadRecords("db/pmacStatus.db","SYS=$(sys),PMAC=$(dev),VERSION=1,PLC=5,NAXES=1,PORT=P0")
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)},AXIS=1,PORT=P0")
#dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV={$(dev)},SPORT=P0")



cd ${TOP}/iocBoot/${IOC}
iocInit
#exit
