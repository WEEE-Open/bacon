#!/bin/bash
# this script is changes the defaults of the director and bconsole

DBPASS=""
cat /etc/bacula/bacula-dir.conf | grep -o 'dbpassword.*' > $DBPASS #retain default db password

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula Director config ++++++++++ \e[0m"
sed -i "/dbname/c \ \ dbname = \"bacula\"; DB Address = \"localhost\"; dbuser = \"bacula\"; $DBPASS" /etc/bacula/bacula-dir.conf 
sed -i 's/{{DIRPASS}}/$DIRPASS/g' /etc/bacula/bacula-dir.conf
sed -i 's/{{CONPASS}}/$CONPASS/g' /etc/bacula/bacula-dir.conf
sed -i 's/{{FDPASS}}/$FDPASS/g' /etc/bacula/bacula-dir.conf
sed -i 's/{{SDPASS}}/$SDPASS/g' /etc/bacula/bacula-dir.conf

echo -e "\e[1;46m ++++++++++ Replacing passwords in Bacula Console config ++++++++++ \e[0m"
sed -i 's/{{CONPASS}}/$CONPASS/g' /etc/bacula/bconsole.conf
