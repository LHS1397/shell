#!/bin/bash
start()
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
  echo "Enter username: "
  echo
  read username
  git config --global user.name "$username"
  echo
  echo "Enter Email address: "
  read email
  git config --global user.email "$email"
  validation
}

validation()
{
  echo
	echo "validating....."
  echo "Check username: "
  echo
  git config --global user.name
  echo
  echo "Check Email: "
  git config --global user.email

}

decision()
{
    echo
    echo "Continue(Y) or Exit(N) Please enter your choice : "
	read choice
	if [[ $choice == y || $choice == Y ]];
        	then
        	start
        else
        	echo
        	echo "Exiting...."
        	exit
        fi
}
start
