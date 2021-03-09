#!/bin/bash

USER_ID=$(id -u)

#if [ "USER_ID" != 0 ]; then
#  echo -e "\e[1;31mYou must be root user to execute this script\e[0m"
#  exit 1
#fi

Print() {
echo -e "\e[1m $(date +%c) \e[35m$(hostname)\e[0m \e[1;36m${COMPONENT}\e[0m :: $1"
}


