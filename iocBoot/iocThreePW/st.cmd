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
pmacCreateController("PMAC1", "P0", 0, 1, 50, 500)
pmacCreateAxis("PMAC1", 1)
dbLoadRecords("db/motor.db","P=$(sys),M={$(dev)-Mtr1},MOTOR=PMAC1,ADDR=1,DESC=asd,DTYP=asynMotor")
dbLoadRecords("db/motorstatus.db","SYS=$(sys),DEV={$(dev)-Mtr1},PORT=P0,AXIS=1")

dbLoadRecords("db/pmacStatus.db","SYS=$(sys),PMAC=$(dev),VERSION=1,PLC=5,NAXES=1,PORT=P0")
dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV={$(dev)-Mtr1},ADDR=1,SPORT=P0,DESC=asd,PREC=5,EGU=cts")
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)-Ax:1},AXIS=1,PORT=P0")
dbLoadRecords("db/asynRecord.db","P=$(sys),R={$(dev)},ADDR=1,PORT=P0,IMAX=128,OMAX=128")





cd ${TOP}/iocBoot/${IOC}
iocInit

