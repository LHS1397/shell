#!/bin/bash

clear
export dat=$(date +%r)
echo
echo "Starting............"
sleep 2s
clear
echo
echo "started at $dat"
echo

echo "Restarting Session Manager Agent:"

systemctl restart amazon-ssm-agent
echo

export inotify=$(cat /proc/sys/fs/inotify/max_user_watches)

echo "Default inotify value is $inotify"
echo
echo

echo "Increasing the inotify watches limit"

echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

echo
echo
echo "Apply the changes, by loading the sysctl settings from /etc/sysctl.conf:"

sysctl -p

echo

i=5;while [ $i -gt 0 ];do if [ $i -gt 9 ];then printf "\b\b$i";else  printf "\b\b $i";fi;sleep 1;i=`expr $i - 1`;done
echo
exit

