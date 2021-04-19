FROM ubuntu:latest 

EXPOSE 9103
ENTRYPOINT service bacula-sd start && /bin/bash

ARG DEBIAN_FRONTEND=noninteractive

COPY script.sh .
RUN chmod 700 script.sh
RUN ./script.sh
COPY ../configs/bacula-sd.conf /etc/bacula/bacula-sd.conf


