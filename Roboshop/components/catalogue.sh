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


echo -n "Switching the User from root to roboshop"
chown -R $APPUSER:$APPUSER /home/roboshop/$COMPONENT/

echo -n "Downloading the $COMPONENT component :"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"   &>> $LOGFILE
stat $?

echo -n "Copying the $COMPONENT to $APPUSER home directory :"
cd /home/roboshop   &>> $LOGFILE
rm -rf $COMPONENT   &>> $LOGFILE
unzip -o /tmp/catalogue.zip        &>> $LOGFILE
mv catalogue-main catalogue     &>> $LOGFILE
stat $?

echo -n "Generating npm $COMPONENT artifacts :"
cd /home/roboshop/catalogue     &>> $LOGFILE
npm install                         &>> $LOGFILE
stat $?

echo -n "Updating the $COMPONENT systemd file :"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/${APPUSER}/${COMPONENT}/systemd.service
mv /home/roboshop/$COMPONENT/systemd.service /etc/systemd/system/$COMPONENT.service
stat $?

echo -n "Starting $COMPONENT service: "
systemctl daemon-reload         &>> $LOGFILE
systemctl enable $COMPONENT          &>> $LOGFILE
systemctl start $COMPONENT          &>> $LOGFILE
systemctl status $COMPONENT -l
stat $?








