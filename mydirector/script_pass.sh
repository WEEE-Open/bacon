#!/bin/bash
# this script is to change the default password of the database which is generated during the install of bacula

DBPASS=""

cat test | grep -o 'dbpassword.*' > $DBPASS

echo -e "\e[1;46m ++++++++++ Setting DB Password in Bacula config ++++++++++ \e[0m"
sed "/dbname/c \ \ dbname = \"bacula\"; DB Address = \"localhost\"; dbuser = \"bacula\"; $DBPASS" /etc/bacula/bacula-dir.conf > /etc/bacula/bacula-dir.conf 

# STILL MISSING: now need to change postgresql passord too