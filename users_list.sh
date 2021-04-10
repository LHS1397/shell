#!/bin/bash -x 

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:; export PATH
source /home/lovish/.bashrc

updated_data()
{
  /bin/echo "Getting User Data - "
  /bin/sleep 2
  if [[ -f "user_data.txt" ]]; 
  then
  mv user_data.txt user_data.txt.old
  set_data
  else
  set_data
  fi
}
set_data()
{
  /usr/bin/getent passwd | awk -F":" '{ print $1" : "$6}' > user_data.txt
  /bin/sleep 2
  hash_gen
}

hash_gen()
{

  export check=$(md5sum user_data.txt | awk '{print $1}')
  touch /home/lovish/shell/cron.log
  touch /var/log/user_changes
  touch /var/log/current_user
}

checksum()
{
  export value=$(cat /home/lovish/shell/cron.log | awk '{print $1}')
  if [[ -z "$value"  || "$check" -eq "$value" ]]; then
  echo "$check" > /home/lovish/shell/cron.log
  /bin/cat /home/lovish/shell/cron.log >> /var/log/current_user
  else
  export change=$(date +%c; comm user_data.txt.old user_data.txt)
  echo "$change" >> /var/log/user_changes
  echo "$check" > /home/lovish/shell/cron.log
  /bin/cat /home/lovish/shell/cron.log > /var/log/current_user
  fi
}

updated_data