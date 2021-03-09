#!/bin/bash

USER_ID=$(id -u)

if [ "USER_ID" != 0 ]; then
  echo -e "\e[31You must be root user to execute this script\e[0m"
fi


