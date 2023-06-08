#!/bin/bash

COMPONENT=frontend

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n " Installing Nginx: "

yum install nginx -y
stat $?

echo -n " Downloading the ${COMPONENT} component: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "Performing cleanup"
cd /usr/share/nginx/html
rm -rf *
stat $?

echo -n "Extracting ${COMPONENT} component :"
unzip /tmp/${COMPONENT}.zip
mv ${COMPONENT}-main/* .
mv static/* .
rm -rf ${COMPONENT}-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Starting $COMPONENT service: "
Systemctl daemon-reload
systemctl enable nginx
systemctl start nginx
stat $?



echo -e "*********** \e[35m $COMPONENT Installation has Completed \e[0m ***********"



