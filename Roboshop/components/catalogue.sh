#!/bin/bash

COMPONENT=catalogue

source components/common.sh

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n  "Configuring the $COMPONENT repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -        &>> $LOGFILE
stat $?

echo -n "Installing NodeJS :"
yum install nodejs -y       &>> $LOGFILE
stat $?


DOWNLOAD_AND_EXTRACT

NPM_INSTALL

echo -n "Updating the $COMPONENT systemd file :"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/${APPUSER}/${COMPONENT}/systemd.service
mv /home/roboshop/$COMPONENT/systemd.service /etc/systemd/system/$COMPONENT.service
stat $?

START_SERVICE


echo -e "*********** \e[35m $COMPONENT Installation has Completed \e[0m ***********"

