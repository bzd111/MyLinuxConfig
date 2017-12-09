#!/usr/bin/env bash

# https://get.daocloud.io
# now install docker
curl -sSL https://get.daocloud.io/docker | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://a7dbd8ae.m.daocloud.io
chmod +x /usr/local/bin/docker-compose
systemctl enable docker
systemctl restart docker


