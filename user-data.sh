#!/bin/bash -x 

updated_data()
{
  cd /home/lovish/shell
  /bin/echo "Getting User Data - "
  /bin/sleep 2
  if [[ -f "user_data.txt" ]]; 
  then
  rm -rf /home/lovish/shell/user_data.txt
  sleep 10
  set_data
  else
  set_data
  fi
}

set_data()
{
  /usr/bin/getent passwd | awk -F":" '{ print $1":"$6; printf "\n"}' > /home/lovish/shell/user_data.txt
  /usr/bin/getent passwd | awk -F":" '{ print $1":"$6; printf "\n"}' > /var/log/cron.log
  cat /home/lovish/shell/user_data.txt
}

updated_data