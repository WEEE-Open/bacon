#!/bin/bash
# this script is changes the defaults of the storagedaemon

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula Director config ++++++++++ \e[0m"
sed -i "s/{{SDPASS}}/$SDPASS/g" /etc/bacula/bacula-sd.conf

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula Director config ++++++++++ \e[0m"
sed -i "s/{{SDADDR}}/$SDADDR/g" /etc/bacula/bacula-sd.conf

echo -e "\e[1;46m ++++++++++ Replacing dir where to place backups in Bacula Director config ++++++++++ \e[0m"
sed -i "s/{{DESTINATION}}/$DESTINATION/g" /etc/bacula/bacula-sd.conf