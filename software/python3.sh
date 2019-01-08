#!/usr/bin/env bash
vserion=$1
# Install dependency
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
# ModuleNotFoundError: No module named '_ctypes'
yum -y install libffi-devel


# Get Version
if [ -z $version ]; 
     then echo 'The lack of the version number.';
     echo 'Use the default, 3.7.0 (y/n)'
     read yes_or_no
     if [ $yes_or_no == 'y' ]; 
         then version='3.7.0'; 
     else exit 1;
     fi 
fi


# Install python3
wget https://www.python.org/ftp/python/$version/Python-$version.tar.xz     
mkdir /usr/local/python3 
tar -xvf Python-$version.tar.xz 
cd Python-$version
./configure --enable-loadable-sqlite-extensions --prefix=/usr/local/python3 --enable-optimizations
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3

# Pip
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
