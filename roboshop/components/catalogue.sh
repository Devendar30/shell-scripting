#!/bin/bash

COMPONENT=catalogue

source components/common.sh

Print "Install nodejs" "Yum Install nodejs"

yum install nodejs make gcc-c++ -y
stat $?

Print "Adding Roboshop user"

id roboshop || useradd roboshop

stat $?

Print "Download catalogue component code"

curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
Print "extract catalogue component code" "rm -rf /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip"

rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip
stat $?

Print " install nodejs dependencis" "npm install"
npm install
stat $?


 #mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
 #systemctl daemon-reload
 #systemctl start catalogue
#systemctl enable catalogue
