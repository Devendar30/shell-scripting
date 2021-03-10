#!/bin/bash

COMPONENT=frontend

source components/common.sh

Print "Installing Nginx" "yum install nginx -y"

# redirecting the message to some log file with below command "&>/tmp/log"
yum install nginx -y &>/tmp/log
stat $?

Print "staring Nginx service" "systemctl start nginx"

systemctl enable nginx
systemctl start nginx
stat $?

Print "Downloading frontend content"

 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

 cd /usr/share/nginx/html
 rm -rf *
 stat $?
Print "Extract Roboshop frontend doc"
 unzip /tmp/frontend.zip &&  mv frontend-main/* . &&  mv static/* . &&  rm -rf frontend-main README.md
 stat $?

 mv localhost.conf /etc/nginx/default.d/roboshop.conf
 systemctl restart nginx
 Print "restarted nginx"