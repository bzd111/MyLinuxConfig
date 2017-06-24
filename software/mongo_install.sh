#!/usr/bin/env bash

# install mongodb
cat <<EOF >/etc/yum.repos.d/mongodb.repo
[mongodb-org]
name=MongoDB Repository
baseurl=https://mirrors.tuna.tsinghua.edu.cn/mongodb/yum/el'$'releasever/
gpgcheck=0
enabled=1
EOF

sudo yum makecache
sudo yum install mongodb-org