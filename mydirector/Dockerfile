FROM ubuntu:latest 

ARG DEBIAN_FRONTEND=noninteractive

COPY script.sh .
RUN chmod 700 script.sh
RUN ./script.sh

EXPOSE 9101
ENTRYPOINT pg_ctlcluster 12 main start && service bacula-director start && /bin/bash
