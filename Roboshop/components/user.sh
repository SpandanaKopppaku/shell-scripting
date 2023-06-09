#!/bin/bash

COMPONENT=user

source components/common.sh

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -e "Downloading the NodeJs repo:"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
stat $?

echo -n "Installing NodeJS:"
yum install nodejs -y

CREATE_USER

echo -n "Switching the User from root to roboshop"
chown -R $APPUSER:$APPUSER /home/roboshop/$COMPONENT/

echo -n "Downloading the $COMPONENT component :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"   &>> $LOGFILE
stat $?

echo -n "Copying the $COMPONENT to $APPUSER home directory :"
cd /home/roboshop   &>> $LOGFILE
rm -rf $COMPONENT   &>> $LOGFILE
unzip -o /tmp/$COMPONENT.zip        &>> $LOGFILE
mv $COMPONENT-main $COMPONENT    &>> $LOGFILE
stat $?

echo -n "Generating npm $COMPONENT artifacts :"
cd /home/roboshop/$COMPONENT     &>> $LOGFILE
npm install                         &>> $LOGFILE
stat $?
