#!/usr/bin/env bash

curl -sL https://rpm.nodesource.com/setup_8.x | bash -
yum install -y nodejs
yum install gcc-c++ make -y
npm install -g bower
