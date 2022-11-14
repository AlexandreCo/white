#!/bin/bash

#install crontab
if sudo crontab -l | grep reboot
then
	echo "reboot already installed"
else
	sudo crontab -l > crontab_new
	echo "30 0 * * * /usr/sbin/reboot" >> crontab_new
	sudo crontab crontab_new
	rm crontab_new
fi

sudo apt-get install fail2ban

if [ -e /etc/fail2ban/jail.d/custom.conf ]
then
	echo "fail2ban already installed"
else

sudo bash -c 'cat << EOF > /etc/fail2ban/jail.d/custom.conf
[DEFAULT]
ignoreip = 127.0.0.1
findtime = 10m
bantime = 24h
maxretry = 3

[sshd]
enabled = true
EOF'
fi

sudo raspi-config nonint enable_overlayfs
