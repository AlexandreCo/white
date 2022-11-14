#!/bin/bash

#install crontab
sudo crontab -l > crontab_new
echo "30 0 * * * /usr/sbin/reboot" >> crontab_new
sudo crontab crontab_new
rm crontab_new

sudo raspi-config nonint enable_overlayfs
