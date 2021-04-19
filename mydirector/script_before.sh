#!/bin/bash
apt-get update

echo -e "\e[1;46m ++++++++++ Debconf Starting ++++++++++ \e[0m"
debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/remote/host select localhost'
debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/dbconfig-install boolean true'

#These debconfs should set the password for the bacula db but I can't make them work 
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/app-password-confirm password hello'
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/pgsql/admin-pass password hello'
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/pgsql/app-pass password hello'
#debconf-set-selections <<< 'bacula-director-pgsql bacula-director-pgsql/password-confirm password hello'

echo -e "\e[1;46m ++++++++++ Installing Nano ++++++++++ \e[0m"
apt-get install -y nano

echo -e "\e[1;46m ++++++++++ Installing Postgre ++++++++++ \e[0m"
apt-get install -y postgresql

echo -e "\e[1;46m ++++++++++ Starting Postgre ++++++++++ \e[0m"
pg_ctlcluster 12 main start

echo -e "\e[1;46m ++++++++++ Installing Director ++++++++++ \e[0m"
apt-get install -y bacula-director

echo -e "\e[1;46m ++++++++++ Installing Console ++++++++++ \e[0m"
apt-get install -y bacula-console

echo -e "\e[1;46m ++++++++++ Installing Iproute2 ++++++++++ \e[0m"
apt-get install -y iproute2

echo -e "\e[1;46m ++++++++++ Starting Director ++++++++++ \e[0m"
service bacula-director start
