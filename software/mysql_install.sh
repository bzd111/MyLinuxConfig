#!/usr/bin/env bash

# install mariadb
yum install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb
mysqladmin -u root -password xxxx
systemctl restart mariadb
