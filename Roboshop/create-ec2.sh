#!/bin/bash

# AMI_ID="ami-0c1d144c8fdd8d690"

aws ec2 describe-images --filters "Name=name,Values=" "Name=root-device-type,Values=DevOps-LabImage-CentOS7"