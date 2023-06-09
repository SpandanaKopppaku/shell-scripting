#!/bin/bash

COMPONENT=redis

source components/common.sh

echo -n "Downloading the redis repo:"
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo

echo -n "Installing the redis repo:"
yum install redis-6.2.11 -y