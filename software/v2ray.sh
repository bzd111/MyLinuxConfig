#!/usr/bin/env bash

# 下载文件
wget https://install.direct/go.sh

# 执行文件
bash go.sh

# 启动
systemctl start v2ray

# 开机自启动
systemctl enable v2ray

# 客户端下载
# https://github.com/v2ray/v2ray-core/releases

# 安装nginx
yum install -y nginx

# 安装cerbot
yum -y install yum-utils
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum install certbot python2-certbot-nginx

# 安装certbot plugins
yum install -y python-pip
pip install certbot-dns-cloudflare
pip install -U setuptools

# 生成证书
mkdir -p ~/.secrets/certbot
cat <<EOF >~/.secrets/certbot/cloudflare.ini
dns_cloudflare_email = email@gmail.com
dns_cloudflare_api_key = xxxxxxxx
EOF
chmod 600 ~/.secrets/certbot/cloudflare.ini

certbot certonly --dns-cloudflare --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini -d hello.com -d hello.com
ln -s /etc/letsencrypt/live/hello.com/privkey.pem /etc/v2ray/v2ray.key
ln -s /etc/letsencrypt/live/hello.com/fullchain.pem /etc/v2ray/v2ray.crt
