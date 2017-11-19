#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Stop process of ROOT by givven PID as parmeter from user
#        The script will stop the process but dont kill him ==> use signal 17 = STOP
#        for example if PID =  5009 then will run "kill -17 5009" 
#Version 1.0
#Date : 8/12/2017
logdir=$(echo $0 |cut -d "." -f2)

# check that folder - name of the script exist
if [ ! -d "/var/log/"$logdir ];then
 mkdir "/var/"log/$logdir             # if not create the folder
fi

read -p "enter PID of process to be stop :" proc_id

echo "start to write to log : $(date)" > /var/log/$logdir/$logdir.log

for proc in $(ps -a -u root |awk '{print $1 }') # first word PID 
do
    if [ $proc = $proc_id ];then    # if proc_id found stop the process
     $(kill -17 $proc_id)
     echo "kill -17 $proc_id " >> /var/log/$logdir/$logdir.log
    else                           # if not found print message to user & log file
     echo "PID process $proc_id not exist for ROOT " |tee  /var/log/$logdir/$logdir.log 
    exit 
     fi
done

echo "end script : $(date)" >> /var/log/$logdir/$logdir.log
