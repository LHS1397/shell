start()
{
		if [[ $EUID == 0 ]];
		then
        echo " please run as normal user "
	else
		userdet
		exit
fi
}
userdet()
{
	clear
	echo
	echo "loading............"
	sleep 3s
	clear
	export dat=$(date +%r)
	echo "started at $dat"
	 echo
	 echo " -----------------"
	 echo "| Git Automation  |"
	 echo " -----------------"
	 echo
	 cd /home
	 echo "Enter the path of the file with 'GIT' initiated:"
	 export dir=$(pwd)
	 export user=$(whoami)
	 echo
	 echo "note:- current directory $dir "
     echo " Current user $user "
	 echo
	read filename
	cd /home/$user/$filename
	echo
	export crnt=$(pwd)
	echo " current path is: $crnt"
	validate
}
validate()
{
	echo
	echo "validating....."
	export ved=$(ls -a | grep .git$)
	sleep 2
	if [[ -e $ved ]];
	then
		echo
	echo "Valid 'git' directory"
else
	echo "Please enter valid path or directory name!"
	sleep 2
	clear
	echo "Reinitating......."
	sleep 2
	userdet
fi
}
start
