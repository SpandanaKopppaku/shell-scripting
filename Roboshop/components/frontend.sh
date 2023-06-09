#!/bin/bash

COMPONENT=frontend

source components/common.sh

echo -n " Installing Nginx: "  &>> $LOGFILE
yum install nginx -y
stat $?

echo -n " Downloading the ${COMPONENT} component: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"      &>> $LOGFILE
stat $?

echo -n "Performing cleanup"
cd /usr/share/nginx/html
rm -rf *  &>> $LOGFILE
stat $?

echo -n "Extracting ${COMPONENT} component :"
unzip /tmp/${COMPONENT}.zip         &>> $LOGFILE
mv ${COMPONENT}-main/* .
mv static/* .
rm -rf ${COMPONENT}-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf        
stat $?

echo -n "updating the proxy details:"

sed -i -e "/catalogue/s/localhost/catalogue.roboshop.internal/" /etc/${COMPONENT}/default.d/roboshop.conf

echo -n "Starting $COMPONENT service: "
systemctl daemon-reload         &>> $LOGFILE
systemctl enable $COMPONENT          &>> $LOGFILE
systemctl start $COMPONENT          &>> $LOGFILE
stat $?



echo -e "*********** \e[35m $COMPONENT Installation has Completed \e[0m ***********"



