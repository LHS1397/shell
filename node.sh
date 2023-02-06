	#!/bin/bash

	start1()
	{
			if [[ $EUID == 0 ]];
			then
			install
		else
			echo "Please run as root!"
			exit
	fi
	}

	install()
	{
	cd /tmp
	echo
	echo "Downloading Node Js Package:"
	echo

	wget https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz >> connect.log

	sleep 2

    echo "Extracting Files:"
	tar xvf node-v16.13.1-linux-x64.tar.xz >> filesextract.log
    echo "Extracted"
	sleep 2
    
    echo
    echo "Setting Up Node-v16 and NPM:"
	mkdir -p /usr/local/nodejs
	mv node-v16.13.1-linux-x64/* /usr/local/nodejs
	echo

	sleep 3
	apt install npm -y
	echo

	sleep 3

	apt install net-tools -y
	echo
	echo "Set Up Completed."
	echo

	sleep 2

	cd /

	echo "Setting Up Path:"

	echo "PATH=$PATH/sbin:/usr/sbin:/usr/local/nodejs/bin" >> ~/.bashrc

	echo "Done"
	echo

	source ~/.bashrc
	echo

	echo PATH=$PATH
	echo

	echo "Installing PM2 Manager for Node server:"

	npm install -g pm2
	echo "Installed"
	echo
	echo "SetUp Completed."
	echo
	echo "Validaging the setup, doing a test run."
	Validaging

	}

	Validaging()
	{
		cd ~
		tee main.js > /dev/null <<EOT
#!/usr/local/nodejs nodejs
var http = require('http');
http.createServer(function (req, res) {
	res.writeHead(200, {'Content-Type': 'text/plain'});
	res.end('Hello World\n');
}).listen(8080, 'localhost');
console.log('Server running at http://localhost:8080/');
EOT

if [[ -f main.js ]]; then
	pm2 start ~/main.js
	echo
	echo
	sleep 5
	echo "Test Service will run for 1 Min on port 8080"
	echo
	pass=$(curl http://localhost:8080)
	echo
	if [[ $pass=="Hello World" ]]; then
		echo $pass
		echo
		echo "Node JS and PM2 setup is workig fine"
		echo
	else
		echo "Either the services not running or the node is not SetUp properly. Kindly try to check manually by running node ~/main.js"
	fi
	echo
	echo "Stopping the services in:"
    i=60;while [ $i -gt 0 ];do if [ $i -gt 9 ];then printf "\b\b$i";else  printf "\b\b $i";fi;sleep 1;i=`expr $i - 1`;done
	pm2 stop main
	pm2 delete main
	echo
	echo "Services Stopped"
	echo
	echo "Exitting in:"
	i=5;while [ $i -gt 0 ];do if [ $i -gt 9 ];then printf "\b\b$i";else  printf "\b\b $i";fi;sleep 1;i=`expr $i - 1`;done
	echo
    else
    	echo "Test fail, no JS file found."
    	echo
    	echo "Exitting in 5 Min"
    	i=5;while [ $i -gt 0 ];do if [ $i -gt 9 ];then printf "\b\b$i";else  printf "\b\b $i";fi;sleep 1;i=`expr $i - 1`;done
    	echo
    	exit
fi
	}

	start1