start()
{
		if [[ $EUID == 0 ]];
		then
		userdet
	else
		echo "Please run as root!"
		exit
fi
}
userdet()
{
	echo "loading............"
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
	 echo
	 export dir=$(pwd)
	 export user=$(users)
	 echo " note:- current directory $dir "
	 echo
	read filename
	cd /home/$user/$filename
	echo
	export crnt=$(pwd)
	echo " current path is: $crnt"
}
start
