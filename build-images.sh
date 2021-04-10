#!/bin/bash

#This script builds the three docker images required for the bacula playground

echo -e "\e[1;46m ++++++++++ Building mydirector image ++++++++++ \e[0m"
docker build -t mydirector:latest ./mydirector/

echo -e "\e[1;46m ++++++++++ Building myfiledaemon image ++++++++++ \e[0m"
docker build -t myfiledaemon:latest ./myfiledaemon/

echo -e "\e[1;46m ++++++++++ Building mystoragedaemon image ++++++++++ \e[0m"
docker build -t mystoragedaemon:latest ./mystoragedaemon/
