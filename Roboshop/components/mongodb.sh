#!/bin/bash

COMPONENT=mongodb

LOGFILE="/tmp/${COMPONENT}.log"

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n "Configuring the $COMPONENT repo:"

curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo   &>> $LOGFILE
stat$?

echo -n "Installing the $COMPONENT:"
yum install -y ${COMPONENT}-org
stat$?

echo -n "Enabling the DB visibility:"
sed -i -e 's/127.0.0.1/0.0.0.0/ /etc/mongod.conf