FROM ubuntu:latest 

EXPOSE 9102
ENTRYPOINT service bacula-fd start && /bin/bash

ARG DEBIAN_FRONTEND=noninteractive

COPY script.sh .
RUN chmod 700 script.sh
RUN ./script.sh
COPY ../configs/bacula-fd.conf /etc/bacula/bacula-fd.conf


