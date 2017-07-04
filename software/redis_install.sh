#!/usr/bin/env bash

yum install epel-release -y
yum install redis -y
sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/' /etc/redis.conf
systemctl start redis
systemctl enable redis
