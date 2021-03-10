#!/bin/bash

COMPONENT=mongodb

source components/common.sh

Print "Set up mongod repo" "mongoDB"

echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
stat $?

Print "Installing mongoDB"
 yum install -y mongodb-org
stat $?

Print " Update mongoDB config" "sed"

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

Print "start mongoBD serveice" "systemctl star mongod"
systemctl restart mongod
stat $?

Print "downlaod mongo scheme"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

stat $?

Print "load schema" ""
cd /tmp && unzip -o mongodb.zip && cd mongodb-main && mongo < catalogue.js && mongo < users.js
stat $?