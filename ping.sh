#!/bin/bash
ipads()
{
  clear
  date +%r
  echo
  echo "AUTHOR - Lovish"
  echo "UNDER  - www.nerdyhacks.in"
  rm ipaddress
  touch ipaddress
  echo
  read -p "enter the count of IP address : " n
  echo
  for ((number=1;number <= $n;number++))
  {
    read -p "enter the IP address: " ipaddr
    echo "$ipaddr" >> ipaddress
  }
  pings
}

pings()
{
 while read line
 do
   ping -c 5 $line >> ping.txt
   Mac=$(arp -n | awk /$line/'{print $1 " - "$3}')
   echo
   echo "The mac address is : "
   echo
   echo $Mac
   echo
 done < ipaddress
}

ipads
