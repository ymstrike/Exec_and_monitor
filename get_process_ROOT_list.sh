#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:List process of root user PID & CMD
#        for example 5009:bash 
#        The script write to log file "get_procees_ROOT_list.log" at /var/log/get_process_list folder
#        the script check if the folder exist and if not create the folder
#Version 1.0
#Date : 8/12/2017
logdir=$(echo $0 |cut -d "." -f2)
#printf "$logdir\n"
if [ ! -d "/var/log/"$logdir ];then
 mkdir "/var/"log/$logdir
fi
echo "start to write to log : $(date)" > /var/log/$logdir/$logdir.log
printf "Process of root : \n"
echo "Process root : " >> /var/log/$logdir/$logdir.log 
for proc in $(ps -a -u root |awk '{print $1 ":" $4}') # first word PID , fourth word CMD
do
    printf "$proc\n"
    echo "$proc" >> /var/log/$logdir/$logdir.log
done

echo "end script : $(date)" >> /var/log/$logdir/$logdir.log
