#!/bin/bash

#Initial configuration for file daemon: 
#It's still missing the edit of /etc/bacula/bacula-fd.conf

apt-get update

echo -e "\e[1;46m ++++++++++ INSTALLING FILE DAEMON ++++++++++ \e[0m"
apt-get install bacula-fd -y

echo -e "\e[1;46m ++++++++++ INSTALLING IPROUTE2 ++++++++++ \e[0m"
apt-get install -y iproute2

echo -e "\e[1;46m ++++++++++ STARTING FILE DAEMON ++++++++++ \e[0m"
service bacula-fd start


