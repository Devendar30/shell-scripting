#!/bin/bash

COMPONENT=frontend

source components/common.sh

Print "Installing Nginx" "yum install nginx -y"

yum install nginx -y &>/tmp/log # redirecting the message to log file
stat $?
Print "staring Nginx service" "systemctl start nginx"
exit
systemctl enable nginx
systemctl start nginx

 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

 cd /usr/share/nginx/html
 rm -rf *
 unzip /tmp/frontend.zip
 mv frontend-main/* .
 mv static/* .
 rm -rf frontend-main README.md
 mv localhost.conf /etc/nginx/default.d/roboshop.conf
 systemctl restart nginx