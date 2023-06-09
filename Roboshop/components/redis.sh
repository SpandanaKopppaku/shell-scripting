#!/bin/bash

COMPONENT=redis

source components/common.sh

echo -n "Downloading the redis repo:"
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
stat $?

echo -n "Installing the redis repo:"
yum install redis-6.2.11 -y
stat $?

echo -n "Enabling the DB visibility :"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf   
stat $? 

echo -n "Starting $COMPONENT service: "
systemctl daemon-reload         &>> $LOGFILE
systemctl enable $COMPONENT          &>> $LOGFILE
systemctl start $COMPONENT          &>> $LOGFILE
stat $?

