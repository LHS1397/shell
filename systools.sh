start()
{
	read user_name = whoami
	if [[ $user_name == "root" ]];
		then
		echo
		clear
	   echo " -----------------"
	   echo "| System tool and |"
	   echo "|    utilities    |"
	   echo " -----------------"
	   echo
		echo "Runnning"
	else
		echo "Please check the file name!"
		exit
fi
}
start
