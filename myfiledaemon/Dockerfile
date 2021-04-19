FROM ubuntu:latest 

EXPOSE 9102
ENTRYPOINT service bacula-fd start && /bin/bash

ARG DEBIAN_FRONTEND=noninteractive

ENV FDPASS=filed

ENV FDADDR=172.18.0.12

# install requisites
COPY script_init.sh .
RUN chmod 700 script_init.sh
RUN ./script_init.sh

# copy the bacula director config file 
COPY bacula-fd.conf /etc/bacula/bacula-fd.conf

# now change passwords
COPY script_conf.sh .
RUN chmod 700 script_conf.sh
RUN ./script_conf.sh


