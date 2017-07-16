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
sudo yum install mongodb-org -y
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl restart mongod
echo "/software/mongodb/bin/mongod --config /software/mongodb/mongo.config" >> /etc/rc.local
