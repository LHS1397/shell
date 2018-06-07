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
  echo "| LOCK EROOR/FIX  |"
  echo "|   Automation    |"
  echo " ----------------- "
  echo
  echo "Doing necessary changes....."
  rm /var/lib/apt/lists/lock >> lists.log
  rm /var/cache/apt/archives/lock >> apt.log
  rm /var/lib/dpkg/lock >> dpkg.log
  echo
  echo "DONE"
  update
}

update()
{
  echo
  echo "NOTE : In case of any error check the log files."
  echo
  echo "Getting Updates.."
  sleep 2s
  apt-get update >> log.update.log
  echo
  echo "upgrading...."
  apt-get -y upgrade >> upgrade.log
  echo
  echo "upgraded."
  echo
  echo "LOG files created, for checking any detail Please refer log files."
}

start1
