#!/bin/bash

#Initial configuration for file daemon: 
#It's still missing the edit of /etc/bacula/bacula-fd.conf

apt-get update

echo -e "\e[1;46m ++++++++++ Installing Nano ++++++++++ \e[0m"
apt-get install -y nano

echo -e "\e[1;46m ++++++++++ Installing File Daemon ++++++++++ \e[0m"
apt-get install -y bacula-fd 

echo -e "\e[1;46m ++++++++++ Installing Iproute2 ++++++++++ \e[0m"
apt-get install -y iproute2

echo -e "\e[1;46m ++++++++++ Starting File Daemon ++++++++++ \e[0m"
service bacula-fd start


