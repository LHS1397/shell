#!/bin/bash -x 

updated_data()
{
  if [[ -f "/var/log/current_user" ]]; 
  then
  rm -rf /var/log/current_user 2>&1 
  sleep 5
  hash_gen
  else
  hash_gen
  fi
}

hash_gen()
{
  if [[ -f "/var/log/user-cron.log" ]]; 
  then
  mv /var/log/user-cron.log /var/log/user-cron.log.old
  fi
  my_array=( $(bash /home/lovish/shell/user-data.sh) )
  for element in "${my_array[@]}"
  do
   echo ${element}
   export check=$(echo -n $element | md5sum | awk '{print $1}')
   echo $check >> /var/log/current_user  
   done
   cp /var/log/current_user /var/log/user-cron.log 
   checksum
}

checksum()
{
  fvalue=$(cat /var/log/current_user | wc -l)
  ovalue=$(cat /var/log/user-cron.log.old | wc -l)
   if [[ $fvalue -eq $ovalue ]]; 
   then
   sleep 7
   echo "No Changes, Exitting in 5 sec"
   exit
   else
   export change=$(date +%c; sort /var/log/user-cron.log.old /var/log/current_user | uniq -d) 
   echo "$change" >> /var/log/user_changes
  fi
}

updated_data