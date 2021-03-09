#!/bin/bash

COMPONENT=frontend

source components/ommon.sh

Print "Installing Nginx"

yum install nginx -y

Print "staring Nginx service"
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