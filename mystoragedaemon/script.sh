#!/bin/bash

#Initial configuration for storage daemon: 
#It's still missing the edit of /etc/bacula/bacula-sd.conf

apt-get update

echo -e "\e[1;46m ++++++++++ Installing Nano ++++++++++ \e[0m"
apt-get install -y nano

echo -e "\e[1;46m ++++++++++ Installing Storage Daemon ++++++++++ \e[0m"
apt-get install -y bacula-sd

echo -e "\e[1;46m ++++++++++ Installing Iproute2 ++++++++++ \e[0m"
apt-get install -y iproute2

echo -e "\e[1;46m ++++++++++ Starting Storage Daemon ++++++++++ \e[0m"
service bacula-sd start


