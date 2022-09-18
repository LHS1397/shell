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
  my_array=( $(bash /home/lovish/shell/user-data.sh) )
  for element in "${my_array[@]}"
  do
   echo ${element}
   export check=$(echo -n $element | md5sum | awk '{print $1}')
   echo $check >> /var/log/current_user 
   if [[ -f "/var/log/user-cron.log" ]]; 
   then
   mv /var/log/user-cron.log /var/log/user-cron.log.old
   echo $check >> /var/log/user-cron.log
   else
   echo $check >> /var/log/user-cron.log 
   fi
   done
   checksum
}

checksum()
{
  fvalue=$(cat /var/log/current_user)
  ovalue=$(cat /var/log/user-cron.log.old)

  for element in "${fvalue[@]}"
  do
  for elements in "${ovalue[@]}"
  do
   if [[ "$element" == "$ovalue" ]]; then
   rm -rf /var/log/user-cron.log.old
   export change=$(date +%c) + "No Change" 
   echo "$change" >> /var/log/user_changes
   else
   export change=$(date +%c; sort /var/log/user-cron.log.old /var/log/user-cron.log | uniq -d) 
   echo "$change" >> /var/log/user_changes
  fi
  done
  done
}

updated_data