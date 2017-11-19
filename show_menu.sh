#!/bin/bash
#Name   :Yuval Matityahu
#Purpose:List process of $USERNAME PID & CMD
#        for example 5009:bash 
#        The script write to log file "get_procees_list.log" at /var/log/get_process_list folder
#        the script check if the folder exist and if not create the folder
#Version 1.0
#Date : 8/12/2017

source ./show_os_statistics.sh

show_menu()
{
clear
printf "==========MAIN MENU==========\n"
printf "1.Show all connected hardware\n"
printf "2.Show all opened port\n"
printf "3.Show all connected users\n"
printf "4.Show status of storage\n"
printf "5.Exit\n"
printf "=============================\n"
printf "\n"
}

read_option()
{
local option
read -p "Please enter option [1 - 5] " option

case $option in
     1) connected_hardware;;
     2) opened_port;;
     3) connected_users;;
     4) status_storage;;
     5) write_end_log;echo Exit from menu .... && sleep 1 &&  break;;
     *) echo "Error You choose wrong option not 1 - 5" && read -p "Press [Enter] key to continue ..." penter
;;
esac
}


while true
do
  show_menu
  read_option
done
