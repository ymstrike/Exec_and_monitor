#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:Show os statistics : connected hardwate,opend port,connected users,status storage
         print on screen & write to log file in /var/log/show_os_statistics/show_statistics.log
#Version 1.0
#Date : 8/12/2017

logdir="show_os_statistics"

if [ ! -d "/var/log/"$logdir ];then
 mkdir "/var/log/"$logdir
fi

echo "start to write to log : $(date)" > /var/log/$logdir/$logdir.log

connected_hardware()
{
 printf "\n"
 echo "Show all connected hardware" |tee -a /var/log/$logdir/$logdir.log
 echo "===================" |tee -a /var/log/$logdir/$logdir.log
 lspci |tee -a /var/log/$logdir/$logdir.log

 read -p "Press [Enter] key to continue ..." penter
}

opened_port()
{
 printf "\n"
 echo "Show all opend port" |tee -a /var/log/$logdir/$logdir.log
 echo "===================" |tee -a /var/log/$logdir/$logdir.log
 netstat -lntu |grep -e ":" |awk '{ print $4}'|cut -d ":" -f2 |sort|uniq |tee /var/log/$logdir/$logdir.log
 read -p "Press [Enter] key to continue ..." penter
}

connected_users()
{
 printf "\n"
 echo  "Show all connected users" |tee -a /var/log/$logdir/$logdir.log
 echo "===================" |tee -a /var/log/$logdir/$logdir.log
 who | tee -a /var/log/$logdir/$logdir.log
 read -p "Press [Enter] key to continue ..." penter

}

status_storage()
{
 printf "\n"
 echo "Show status storage" |tee -a /var/log/$logdir/$logdir.log
 echo "===================" |tee -a /var/log/$logdir/$logdir.log
 df -h | tee -a /var/log/$logdir/$logdir.log
 read -p "Press [Enter] key to continue ..." penter

}

error_msg()
{
echo "Error You choose wrong option not 1 - 5"|tee -a /var/log/$logdir/$logdir.log && read -p "Press [Enter] key to continue ..." penter
}

write_end_log()
{
echo "End log $(date)" >> /var/log/$logdir/$logdir.log
}

 

