#!/bin/bash
# this script is changes the defaults of the filedaemon

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula file daemon config ++++++++++ \e[0m"
sed -i "s/{{FDPASS}}/$FDPASS/g" /etc/bacula/bacula-fd.conf

echo -e "\e[1;46m ++++++++++ Replacing addr in Bacula file daemon config ++++++++++ \e[0m"
sed -i "s/{{FDADDR}}/$FDADDR/g" /etc/bacula/bacula-fd.conf