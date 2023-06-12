#!/bin/bash

# AMI_ID="ami-0c1d144c8fdd8d690"

COMPONENET=$1
ENV=$2

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq '.Images[].ImageId'|sed -e 's/"//g')
SG_ID=$(aws ec2 describe-security-groups --filters Name=group-name,Values=b54-allow-all | jq '.SecurityGroups[].GroupId' | sed -e 's/"//g')

echo -e "AMI ID used to launch the EC2 is \e[35m $AMI_ID \e[0m"
echo -e "Security Group ID used to launch the EC2 is \e[35m $SG_ID \e[0m"
echo -e "\e[36m **** Launching Server **** \e[0m"


aws ec2 run-instances  --image-id ${AMI_ID}  --instance-type t3.micro --security-group-ids $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$COMPONENT-$ENV}]"