FROM ubuntu:latest 

EXPOSE 9101
ENTRYPOINT pg_ctlcluster 12 main start && service bacula-director start && /bin/bash

ARG DEBIAN_FRONTEND=noninteractive

ENV DIRPASS=director
#ENV CONPASS=bconsole # in the end I used the dirpass also in the console 
ENV FDPASS=filed
ENV SDPASS=storaged

ENV DIRADDR=172.18.0.11
ENV FDADDR=172.18.0.12
ENV SDADDR=172.18.0.13

ENV FDRESTOREDIR=/home/backup/
ENV FDBACKUPDIR=/home/
#to change the path of the sd go to the sd config

# install requisites
COPY script_init.sh .
RUN chmod 700 script_init.sh
RUN ./script_init.sh

# copy the bacula director config file 
COPY bacula-dir.conf /etc/bacula/bacula-dir.conf
COPY bconsole.conf /etc/bacula/bconsole.conf

# now change passwords
COPY script_conf.sh .
RUN chmod 700 script_conf.sh
RUN ./script_conf.sh