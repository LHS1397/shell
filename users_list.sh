#!/bin/bash -x 

updated_data()
{
  if [[ -f "/var/log/current_user" ]]; 
  then
  rm -rf /var/log/current_user 2>&1 
  sleep 15
  hash_gen
  else
  hash_gen
  fi
}

hash_gen()
{
  my_array=( $(bash /home/lovish/shell/user-data.sh) )
  for element in "${my_array[@]}"
  do
   echo ${element}
   export check=$(echo -n $element | md5sum | awk '{print $1}')
   echo $check >> /var/log/current_user 
   done
   checksum
}

checksum()
{
  declare -A value
  value=$(cat /home/lovish/shell/cron.log | awk '{print $1}')
  if [[ -z "$value"  || 64#$check -eq 64#$value ]]; then
  echo "$check" > /home/lovish/shell/cron.log
  /bin/cat /home/lovish/shell/cron.log >> /var/log/current_user
  rm -rf user_data.txt.old
  else
  export change=$(date +%c; comm -3 user_data.txt.old user_data.txt)
  echo "$change" >> /var/log/user_changes
  echo "$check" > /home/lovish/shell/cron.log
  /bin/cat /home/lovish/shell/cron.log > /var/log/current_user
  rm -rf user_data.txt.old
  fi
}

updated_data