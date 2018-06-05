#!/usr/bin bash
# 前期准备
yum -y install python-setuptools
easy_install pip
pip install shadowsocks

# 启动ss
ssserver -p 8388 -k fangqiang -m rc4-md5 -d start

# 开放8388端口,重启防火墙
firewall-cmd --zone=public --add-port=8388/tcp --permanent
systemctl restart firewalld

# 开机启动
echo "ssserver -p 8388 -k fangqiang -m rc4-md5 -d start" >> /etc/rc.local
# bbr加速
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chomd +x bbr.sh
./bbr.sh
