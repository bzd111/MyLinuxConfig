#!/usr/bin/env bash

# yum switch aliyun
yum install wget -y
mv /etc/yum.repos.d /etc/yum.repos.d.backup4comex
mkdir /etc/yum.repos.d
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache

# https://get.daocloud.io
# now install docker
curl -sSL https://get.daocloud.io/docker | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl enable docker

# now start install
yum install -y update
yum install -y python-devel
yum install  -y  ctags vim curl tmux  zsh git httpie ssh make lrzsz gcc cmake

easy_install pip
mkdir /root/.pip
cat <<EOF >~/.pip/pip.conf
[global]
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
EOF

pip install ipython==5.0.0 -q


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

# install YouCompleteMe
cd  ~/.vim/bundle/YouCompleteMe
./install.py

# config ipython
ipython profile create
mv /root/.ipython/profile_default/ipython_config.py /root/.ipython/profile_default/ipython_config.py1
cp $(pwd)/ipython_config.py ipython_config.py


# restart
reboot -h 0



