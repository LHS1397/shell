#!/bin/bash -x 

updated_data()
{
  /bin/echo "Getting User Data - "
  /bin/sleep 2
  if [[ -f "/var/log/user_data.txt" ]]; 
  then
  rm -rf /var/log/user_data.txt
  sleep 5
  set_data
  else
  set_data
  fi
}

set_data()
{
  /usr/bin/getent passwd | awk -F":" '{ print $1":"$6; printf "\n"}' > /var/log/user_data.txt
  cat /var/log/user_data.txt
}

updated_data