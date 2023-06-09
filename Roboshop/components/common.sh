#!/bin/bash

APPUSER="roboshop"
LOGFILE="/tmp/${COMPONENT}.log"

ID=$(id -u)

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


CREATE_USER() {

    id $APPUSER
    if [ $? -ne 0 ] ; then

        echo -n "Creating the Service Account :"
        useradd roboshop    &>> $LOGFILE
        stat $?

    fi
}

DOWNLOAD_AND_EXTRACT() {

    echo -n "Downloading the $COMPONENT component :"
    curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
    stat $? 

    echo -n "Copying the $COMPONENT to $APPUSER home directory :"
    cd /home/${APPUSER}/
    rm -rf  ${COMPONENT}  &>> $LOGFILE
    unzip -o /tmp/${COMPONENT}.zip  &>> $LOGFILE
    stat $?

    echo -n "Modifying the ownership :"
    mv $COMPONENT-main/ $COMPONENT
    chown -R $APPUSER:$APPUSER /home/roboshop/$COMPONENT/
    stat $?

}
