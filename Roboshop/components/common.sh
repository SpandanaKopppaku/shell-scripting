#!/bin/bash


LOGFILE="/tmp/${COMPONENT}.log"

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

if [ $ID -ne 0 ] ; then      &>> $LOGFILE

    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilege \e[0m" 
    exit 1

fi

stat() {
    if [ $1 -eq 0 ] ; then      &>> $LOGFILE
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi 
}
