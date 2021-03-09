#!/bin/bash

USER_ID=$(id -u)

if [ "USER_ID" != 0 ]; then
  echo -e "\e[31mYou must be root user to execute this script\e[0m"
  exit 1
fi


