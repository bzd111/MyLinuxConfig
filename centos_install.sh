#!/usr/bin/env bash

# yum switch aliyun
yum install wget -y
mv /etc/yum.repos.d /etc/yum.repos.d.backup4comex
mkdir /etc/yum.repos.d
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache

# now start install
yum install -y update
yum install -y python-devel
yum install  -y  ctags vim curl tmux  zsh git httpie ssh make lrzsz

# install zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
chsh -s /bin/zsh
cp $(pwd)/centos_zshrc  ~/.zshrc

# install autojump
#yum  install -y autojump
#cd ~
#echo ". /usr/share/autojump/autojump.sh" >> .zshrc
git clone git://github.com/joelthelion/autojump.git /root/autojump
cd /root/autojump
./install.py

cd - 
# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp $(pwd)/centos_vimrc ~/.vimrc
vim +PluginInstall +qall

# config tmux
cp $(pwd)/centos_tmux.conf ~/.tmux.conf
tmux kill-server

# restart
reboot -h 0
