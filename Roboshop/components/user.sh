#!/bin/bash

COMPONENT=user

source components/common.sh

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -e "Downloading the NodeJs repo:"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
stat $?

echo -n "Installing NodeJS:"
yum install nodejs -y

CREATE_USER

DOWNLOAD_AND_EXTRACT

NPM_INSTALL
