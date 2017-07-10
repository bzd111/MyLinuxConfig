#!/usr/bin/env bash

# yum switch aliyun
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum makecache

# https://get.daocloud.io
# now install docker
curl -sSL https://get.daocloud.io/docker | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl enable docker

# now start install
yum install -y python-devel mysql-devel
yum install  -y  ctags vim curl tmux  zsh git ssh make lrzsz gcc cmake
yum install the_silver_searcher -y

easy_install pip
mkdir /root/.pip
cat <<EOF >~/.pip/pip.conf
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
EOF

pip install ipython==5.0.0 -q
pip install thefuck
pip install tldr
pip install httpie

# install zsh
sudo yum update && sudo yum -y install zsh
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
cd -

# config ipython
ipython profile create
mv /root/.ipython/profile_default/ipython_config.py /root/.ipython/profile_default/ipython_config.py1
cp $(pwd)/ipython_config.py /root/.ipython/profile_default/ipython_config.py

# install ag
yum -y groupinstall "Development Tools"
yum -y install pcre-devel xz-devel
git clone https://github.com/ggreer/the_silver_searcher.git ag
cd ag
./build.sh
sudo make install

# restart
reboot -h 0
