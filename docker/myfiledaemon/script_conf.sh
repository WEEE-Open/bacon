#!/bin/bash

# this script changes the placeholder vales of the file daemon config

echo -e "\e[1;46m ++++++++++ Duplicating template ++++++++++ \e[0m"
cp /etc/bacula/bacula-fd.conf.template /etc/bacula/bacula-fd.conf

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula file daemon config ++++++++++ \e[0m"
sed -i "s/{{FDPASS}}/$FDPASS/g" /etc/bacula/bacula-fd.conf

echo -e "\e[1;46m ++++++++++ Replacing addr in Bacula file daemon config ++++++++++ \e[0m"
sed -i "s/{{FDADDR}}/$FDADDR/g" /etc/bacula/bacula-fd.conf