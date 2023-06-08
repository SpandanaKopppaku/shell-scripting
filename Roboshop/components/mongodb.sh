#!/bin/bash

COMPONENT=mongodb

LOGFILE="/tmp/${COMPONENT}.log"

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n "Configuring the $COMPONENT repo:"

curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo   &>> $LOGFILE
stat$?

echo -n "Installing the $COMPONENT:"
yum install -y ${COMPONENT}-org         &>> $LOGFILE
stat$?

echo -n "Enabling the DB visibility:"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf       &>> $LOGFILE
stat$?

echo -n "Starting the ${COMPONENT} Service: "
systemctl daemon-reload mongod      &>> $LOGFILE
systemctl enable mongod             &>> $LOGFILE
systemctl restart mongod            &>> $LOGFILE
stat$?

echo -n " Downloading the ${COMPONENT} schema:"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"      &>> $LOGFILE
stat$?

echo -n "Extracting the $COMPONENT Schema:"
cd /tmp
unzip -o ${COMPONENT}.zip   &>> $LOGFILE
stat$?

echo -n "Injecting the schema:"
cd ${COMPONENT}-main    
mongo < catalogue.js        &>> $LOGFILE
mongo < users.js            &>> $LOGFILE
stat$?

echo -e "*********** \e[35m $COMPONENT Installation is completed \e[0m ***********"
