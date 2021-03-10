#!/bin/bash

component=$1

if [ -z "$component" ]; then
  echo Need a Input of component Name
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=lt-061f7c4e2482ab086 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"



