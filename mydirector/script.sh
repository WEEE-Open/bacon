#!/bin/bash
apt-get update

echo -e "\e[1;46m ++++++++++ DEBCONF STARTING ++++++++++ \e[0m"
debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/remote/host select localhost'
debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/dbconfig-install boolean true'

#These debconfs should set the password for the bacula db but I can't make them work 
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/app-password-confirm password hello'
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/pgsql/admin-pass password hello'
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/pgsql/app-pass password hello'
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/password-confirm password hello'

echo -e "\e[1;46m ++++++++++ INSTALLING POSTGRE ++++++++++ \e[0m"
apt-get install postgresql -y

echo -e "\e[1;46m ++++++++++ STARTING POSTGRE ++++++++++ \e[0m"
pg_ctlcluster 12 main start

echo -e "\e[1;46m ++++++++++ INSTALLING DIRECTOR ++++++++++ \e[0m"
apt-get install bacula-director -y

echo -e "\e[1;46m ++++++++++ INSTALLING CONSOLE ++++++++++ \e[0m"
apt-get install bacula-console -y

echo -e "\e[1;46m ++++++++++ INSTALLING IPROUTE2 ++++++++++ \e[0m"
apt-get install -y iproute2

echo -e "\e[1;46m ++++++++++ STARTING DIRECTOR ++++++++++ \e[0m"
service bacula-director start

