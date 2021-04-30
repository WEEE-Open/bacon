#!/bin/bash
# this script is changes the defaults of the storagedaemon

echo -e "\e[1;46m ++++++++++ Duplicating template ++++++++++ \e[0m"
cp /etc/bacula/bacula-sd.conf.template /etc/bacula/bacula-sd.conf

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula storage daemon config ++++++++++ \e[0m"
sed -i "s/{{SDPASS}}/$SDPASS/g" /etc/bacula/bacula-sd.conf

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula storage daemon config ++++++++++ \e[0m"
sed -i "s/{{SDADDR}}/$SDADDR/g" /etc/bacula/bacula-sd.conf

echo -e "\e[1;46m ++++++++++ Replacing directories in Bacula storage daemon config ++++++++++ \e[0m"
sed -i "s@{{SDDIR}}@$SDDIR@g" /etc/bacula/bacula-sd.conf