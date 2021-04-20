FROM ubuntu:latest 

EXPOSE 9103
ENTRYPOINT service bacula-sd start && /bin/bash

ARG DEBIAN_FRONTEND=noninteractive

ENV SDPASS=storaged

ENV SDADDR=172.18.0.13

ENV DESTINATION=/root/

# install requisites
COPY script_init.sh .
RUN chmod 700 script_init.sh
RUN ./script_init.sh

# copy the bacula director config file 
COPY bacula-sd.conf /etc/bacula/bacula-sd.conf

# now change passwords
COPY script_conf.sh .
RUN chmod 700 script_conf.sh
RUN ./script_conf.sh


