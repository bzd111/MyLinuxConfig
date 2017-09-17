#!/usr/bin/env bash

# install mariadb
yum install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb
systemctl restart mariadb
pip install -q mycli
mysqladmin -u root -p password xxxx
