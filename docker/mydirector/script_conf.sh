#!/bin/bash

# this script changes the placeholder vales of the director and console configs

DBPASS=$(cat dbpass.txt) #read default password

echo -e "\e[1;46m ++++++++++ Duplicating template ++++++++++ \e[0m"
cp /etc/bacula/bacula-dir.conf.template /etc/bacula/bacula-dir.conf
cp /etc/bacula/bconsole.conf.template /etc/bacula/bconsole.conf

echo -e "\e[1;46m ++++++++++ Replacing pass in Bacula Director config ++++++++++ \e[0m"
sed -i "s/{{DIRPASS}}/$DIRPASS/g" /etc/bacula/bacula-dir.conf
sed -i "s/{{CONPASS}}/$CONPASS/g" /etc/bacula/bacula-dir.conf
sed -i "s/{{FDPASS}}/$FDPASS/g" /etc/bacula/bacula-dir.conf
sed -i "s/{{SDPASS}}/$SDPASS/g" /etc/bacula/bacula-dir.conf

# here I replace the placeholder bacula db password with the one the system automatically generated during the install 
sed -i "/dbname/c \ \ dbname = \"bacula\"; DB Address = \"localhost\"; dbuser = \"bacula\"; $DBPASS" /etc/bacula/bacula-dir.conf 
#rm -f dbpass.txt

echo -e "\e[1;46m ++++++++++ Replacing pass in Bacula Console config ++++++++++ \e[0m"
sed -i "s/{{DIRPASS}}/$DIRPASS/g" /etc/bacula/bconsole.conf

echo -e "\e[1;46m ++++++++++ Replacing addr in Bacula Director config ++++++++++ \e[0m"
sed -i "s/{{DIRADDR}}/$DIRADDR/g" /etc/bacula/bacula-dir.conf
sed -i "s/{{CONADDR}}/$CONADDR/g" /etc/bacula/bacula-dir.conf
sed -i "s/{{FDADDR}}/$FDADDR/g" /etc/bacula/bacula-dir.conf
sed -i "s/{{SDADDR}}/$SDADDR/g" /etc/bacula/bacula-dir.conf

echo -e "\e[1;46m ++++++++++ Replacing addr in Bacula Console config ++++++++++ \e[0m"
sed -i "s/{{DIRADDR}}/$DIRADDR/g" /etc/bacula/bconsole.conf

echo -e "\e[1;46m ++++++++++ Replacing directories of the fd in Bacula Director config ++++++++++ \e[0m"
sed -i "s@{{FDRESTOREDIR}}@$FDRESTOREDIR@g" /etc/bacula/bacula-dir.conf
sed -i "s@{{FDBACKUPDIR}}@$FDBACKUPDIR@g" /etc/bacula/bacula-dir.conf