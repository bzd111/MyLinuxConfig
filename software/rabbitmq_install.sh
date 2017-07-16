#!/usr/bin/env bash

# install rabbitmq
yum -y install rabbitmq-server

# install pika
pip install -q pika

systemctl start rabbitmq-server.service
systemctl enable rabbitmq-server.service
