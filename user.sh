start1()
{
		if [[ $EUID == 0 ]];
		then
		start
	else
		echo "Please run as root!"
		exit
fi
}

start()
{
  clear
  export dat=$(date +%r)
  echo
  echo "Starting............"
  sleep 2s
  clear
  echo
  echo "started at $dat"
   echo
   echo " ----------------- "
   echo "| User Automation  |"
   echo " ----------------- "
   echo
   echo "Available USER's :"
   echo
   ls /home
   echo
   shell
}

shell()
{
  echo "# /etc/shells: valid login shells "
  echo
  cat shells.avail
  echo
  read -p "Slect the shell you want to choose(1-6) : " shell
  export shl=$(sed $shell'!d' shells.avail)
  echo
  echo "Your choice :" $shl
  echo
  user
}

user()
{
  read -p "enter the USER NAME to add : " n
  echo
  echo "NOTE : Leave Blank and Press enter if no group to specify"
  echo
  read -p "Enter PRIMARY Group : " g
  echo
  read -p "Enter SECONDARY Group : " G
  echo
  read -p "Root account (yes/no) : " r
  echo
  read -p "Home account (yes/no) : " m
  echo

  if [[ $g != 0 && $G != 0  && $r = 'yes' && $m = 'yes' ]]; then
    useradd -g $g -G $G -m -r -s $shl $n
  elif [[ $g == 0 && $G == 0  && $r = 'no' && $m = 'no' ]]; then
    useradd $n
  elif [[ $g == 0 && $G == 0  && $r = 'yes' && $m = 'yes' ]]; then
    useradd -m -r -s $shl $n
  elif [[ $g != 0 && $G != 0  && $r = 'no' && $m = 'no' ]]; then
    useradd -g $g -G $G $n
  elif [[ $g != 0 && $G == 0  && $r = 'no' && $m = 'no' ]]; then
    useradd -g $g $n
  elif [[ $g == 0 && $G != 0  && $r = 'no' && $m = 'no' ]]; then
    useradd -G $G -s $shl $n
  elif [[ $g != 0 && $G == 0  && $r = 'no' && $m = 'no' ]]; then
    useradd -g $g -s $shl $n
  elif [[ $g != 0 && $G == 0  && $r = 'yes' && $m = 'no' ]]; then
    useradd -g $g -r -s $shl $n
  elif [[ $g != 0 && $G == 0  && $r = 'no' && $m = 'yes' ]]; then
    useradd -g $g -m -s $shl $n
  fi

}

start1
