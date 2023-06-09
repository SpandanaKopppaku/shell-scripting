#!/bin/bash

COMPONENT=redis

source components/common.sh

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n "Downloading the $COMPONENT repo:"
curl -L https://raw.githubusercontent.com/stans-robot-project/$COMPONENT/main/$COMPONENT.repo -o /etc/yum.repos.d/$COMPONENT.repo      &>> $LOGFILE
stat $?

echo -n "Installing the $COMPONENT:"
yum install $COMPONENT-6.2.11 -y     &>> $LOGFILE
stat $?

echo -n "Enabling the DB visibility :"
ed -i -e 's/127.0.0.1/0.0.0.0/' /etc/$COMPONENT.conf    &>> $LOGFILE
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/$COMPONENT/$COMPONENT.conf   &>> $LOGFILE
stat $? 

START_SVC

echo -e "*********** \e[35m $COMPONENT Installation has Completed \e[0m ***********"