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

rm -rf /home/roboshop/catalogue/catalogue-main && mkdir -p /home/roboshop/catalogue/catalogue-main && cd /home/roboshop/catalogue/catalogue-main && unzip /tmp/catalogue.zip
stat $?

Print " install nodejs dependencis" "npm install"
npm install --unsafe-perm
stat $?

Print "update systemD"

sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devendar.tk/' /home/roboshop/catalogue/catalogue-main/systemd.service && mv /home/roboshop/catalogue/catalogue-main/systemd.service /etc/systemd/system/catalogue.service
stat $?
Print "start catalogue service" ""
 systemctl daemon-reload && systemctl restart catalogue && systemctl enable catalogue
stat $?