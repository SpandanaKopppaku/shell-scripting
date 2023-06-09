#!/bin/bash

COMPONENT=catalogue
APPUSER="roboshop"

source components/common.sh

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n  "Configuring the $COMPONENT repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -        &>> $LOGFILE
stat $?

echo -n "Installing NodeJS :"
yum install nodejs -y       &>> $LOGFILE
stat $?

id $APPUSER
if [ $? -ne 0 ] ; then

    echo -n "Creating the Service Account :"
    useradd roboshop    &>> $LOGFILE
    stat $?

fi

echo -n "Downloading the $COMPONENT component :"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"   &>> $LOGFILE
cd /home/roboshop

cd /home/roboshop   &>> $LOGFILE
unzip /tmp/catalogue.zip        &>> $LOGFILE
mv catalogue-main catalogue     &>> $LOGFILE
cd /home/roboshop/catalogue     &>> $LOGFILE
npm install                     &>> $LOGFILE







