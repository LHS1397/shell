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
}

updated_data