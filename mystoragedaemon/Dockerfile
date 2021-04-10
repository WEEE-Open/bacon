FROM ubuntu:latest 

ARG DEBIAN_FRONTEND=noninteractive

COPY script.sh .
RUN chmod 700 script.sh
RUN ./script.sh

EXPOSE 9103
ENTRYPOINT service bacula-sd start && /bin/bash
