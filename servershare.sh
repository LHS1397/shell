#!/bin/bash 
user()
{
  echo
  echo " ---------------------"
  echo "| Server File Sharing |"
  echo " ---------------------"
  echo
  read -p "Enter the User Name : " User
  echo
  read -p "Enter Server's IP address : " ip
  echo
  read -p "Enter file Name With Path : " file
  echo
  read -p "Enter the Path of the Destination Location : " Path
  echo
  transfer
}

transfer()
{
  echo
  echo "Checkig if Server is UP or DOWN? "
  echo
  ping -c 1 $ip > ping
  if [[ "$?" -eq 0 ]]; then
    echo "$ip Reachable.."
    rm -rf ping
    echo
    scp $file $User@$ip:/$Path
    echo
  else
    echo "$ip Not Reachable/ DOWN"
  fi
}
user
