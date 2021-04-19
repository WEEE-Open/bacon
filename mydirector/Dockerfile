FROM ubuntu:latest 

EXPOSE 9101
ENTRYPOINT pg_ctlcluster 12 main start && service bacula-director start && /bin/bash

ARG DEBIAN_FRONTEND=noninteractive

# install requisites
COPY script_before.sh .
RUN chmod 700 script_before.sh
RUN ./script_before.sh

# copy the bacula director config file 
COPY ../configs/bacula-dir.conf /etc/bacula/bacula-dir.conf
COPY ../configs/bconsole.conf /etc/bacula/bconsole.conf

# now change passwords
COPY script_pass.sh .
RUN chmod 700 script_pass.sh
RUN ./script_pass.sh