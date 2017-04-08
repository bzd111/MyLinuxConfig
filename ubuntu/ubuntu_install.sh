#!/usr/bin/env bash

#for zh-cn utf8 ubuntu14.04
sudo apt-get update
sudo apt-get install -y language-pack-zh-hant-base language-pack-zh-hans-base language-pack-zh
sudo locale-gen zh_CN.UTF-8
echo 'LC_ALL="zh_CN.UTF-8"' | sudo tee -a /etc/environment
sudo dpkg-reconfigure locales

#for ubuntu common tools
sudo apt-get install -y vim curl tmux build-essential zsh git wget ssh make httpie
sudo apt-get install -y silversearcher-ag, pastebinit    # pastebinit -i filename
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y trash-cli

# open terminal in finder
sudo apt-get install -y nautilus-open-terminal
nautilus -q

# install zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
chsh -s /bin/zsh
cp $(pwd)/ubuntu_zshrc  ~/.zshrc


# for docker install ubuntu14.04
#sudo apt-get update
#sudo apt-get install -y apt-transport-https ca-certificates
#sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | sudo tee /etc/apt/sources.list.d/docker.list
#sudo apt-get update
#sudo apt-get purge lxc-docker
#sudo apt-cache policy docker-engine
#sudo apt-get install -y docker-engine
#sudo service docker start
#sudo docker run hello-world

mkdir /root/.pip
cat <<EOF >~/.pip/pip.conf
[global]
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
EOF

pip install ipython -q


# https://get.daocloud.io
curl -sSL https://get.daocloud.io/docker | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl enable docker

# for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp $(pwd)/ubuntu_vimrc ~/.vimrc
vim +PluginInstall +qall


# modify capslock to ctrl
# sudo vi /etc/default/keyboard
echo 'XKBOPTIONS="ctrl:nocaps"' | sudo tee -a /etc/default/keyboard
sudo dpkg-reconfigure keyboard-configuration


# restart
sudo reboot -h 0


# install autojump
sudo apt-get install autojump
cd ~
echo ". /usr/share/autojump/autojump.sh" >> .zshrc

# config tmux
cp $(pwd)/centos_tmux.conf ~/.tmux.conf
tmux kill-server
