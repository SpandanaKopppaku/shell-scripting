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

