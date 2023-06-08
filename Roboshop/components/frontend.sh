#!/bin/bash

COMPONENT=frontend

LOGFILE="/tmp/${COMPONENT}.log"

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

if [ $ID -ne 0 ] ; then

    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilege \e[0m"
    exit 1

fi

stat() {
    if [ $1 -eq 0 ] ; then 
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi 
}

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

echo -n "Starting $COMPONENT service: "
systemctl daemon-reload         &>> $LOGFILE
systemctl enable nginx          &>> $LOGFILE
systemctl start nginx           &>> $LOGFILE
stat $?



echo -e "*********** \e[35m $COMPONENT Installation has Completed \e[0m ***********"



