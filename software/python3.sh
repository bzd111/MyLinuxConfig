#!/usr/bin/env bash

# install dependency
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

# install python3
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz
mkdir /usr/local/python3 
tar -zxvf Python-3.6.1.tgz
cd Python-3.6.1
./configure --prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3

# install pip for python3
wget https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9
tar -zxvf pip-9.0.1.tar.gz
cd pip-9.0.1
python3 setup.py build
python3 setup.py install
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
