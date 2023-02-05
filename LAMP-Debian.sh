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
echo
echo "Downloading and Installing LAMP (Apache, MySql, PHP) Package:"
echo

sudo apt update
echo

sleep 2

sudo apt install apache2 -y
echo

sleep 2

sudo apt install mysql-server -y
echo

sleep 2

sudo apt install php libapache2-mod-php php-mysql -y
echo

sleep 3

echo
echo "Configuring (Apache, PHP):"
echo

tee /etc/apache2/mods-enabled/dir.conf > /dev/null << EOF
<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.php index.xhtml index.htm
</IfModule>
EOF

sudo systemctl restart apache2

tee /var/www/html/info.php > /dev/null << EOF
<?php
phpinfo ();
?>
EOF
}

start1


