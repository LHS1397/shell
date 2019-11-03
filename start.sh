#!/bin/bash
start1()
{
		if [[ $EUID == 0 ]];
		then
		start2
	else
		echo "Please run as root!"
		exit
fi
}
start2()
{
  clear
  export dat=$(date +%r)
  echo
  echo "Starting............"
  sleep 2s
  clear
  echo "started at $dat"
   echo
   echo " -----------------"
   echo "| Git Automation  |"
   echo " -----------------"
   echo
   validation
}

validation()
{
	echo "validating....."
  echo
  echo "Checking username: "
  echo
  export user=$(git config --global user.name)
  echo "$user"
  echo
  echo "Checking Email: "
  echo
  export mail=$(git config --global user.email)
  echo "$mail"
  echo
  if [[ ! -z $user && ! -z $mail ]]; then
  echo "The Git is already configured"
 echo
 echo "Redirecting......."
  sleep 3
  ./systools.sh
  echo
  else
  run
fi
}

run()
{
  echo
  echo "Would you like to re/configure or Continue to the Git Automation: "
  echo
  echo "Enter your choice : "
  echo
  options=("reconfigure" "Continue" "exit")
  select opt in "${options[@]}"
  do
  case $opt in
   "reconfigure")
   echo
   echo "Enter username: "
   echo
   read username
   echo
   echo "Enter Email address: "
   echo
   read email
   echo
   echo "Setting Username and Email"
   echo
   echo "settiing............"
   git config --global user.name "$username"
   git config --global user.email "$email"
   sleep 1
   if [[ $user == $username && $mail == $email ]]; then
   echo "Done."
   ./systools.sh
   fi
     ;;
     "Continue")
     echo "Redirecting....."
     sleep 1
     ./systools.sh
     ;;
     "exit")
     echo "exitting...."
     sleep 2
     exit
   esac
  done
}
start1
