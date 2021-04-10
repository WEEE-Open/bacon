#!/bin/bash

#Initial configuration for storage daemon: 
#It's still missing the edit of /etc/bacula/bacula-sd.conf

apt-get update

echo -e "\e[1;46m ++++++++++ INSTALLING STORAGE DAEMON ++++++++++ \e[0m"
apt-get install bacula-sd -y

echo -e "\e[1;46m ++++++++++ INSTALLING IPROUTE2 ++++++++++ \e[0m"
apt-get install -y iproute2

echo -e "\e[1;46m ++++++++++ STARTING STORAGE DAEMON ++++++++++ \e[0m"
service bacula-sd start

