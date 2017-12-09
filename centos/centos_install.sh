#!/usr/bin/env bash
INSTALL_PATH=$(cd `dirname $0`;pwd)
# yum switch aliyun
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum makecache

# now start install
yum install -y python-devel mysql-devel
yum install  -y  ctags vim curl tmux git ssh make lrzsz gcc cmake
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
rm -rf /root/.oh-my-zsh
chsh -s /bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp $INSTALL_PATH/centos_zshrc  ~/.zshrc

# install autojump
#yum  install -y autojump
#cd ~
#echo ". /usr/share/autojump/autojump.sh" >> .zshrc
git clone git://github.com/joelthelion/autojump.git /root/autojump
cd /root/autojump
./install.py

# update vim for YouCompleteMe
sh -c ../software/vim_update_8.0.sh

cd -
# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp $INSTALL_PATH/centos_vimrc ~/.vimrc
vim +PluginInstall +qall

# config tmux
cp $INSTALL_PATH/centos_tmux.conf ~/.tmux.conf
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
cd -

# copy color theme
mkdir /root/.vim/colors
cp /root/.vim/bundle/vim-colorschemes/colors/wombat256mod.vim  /root/.vim/colors/

# copy UltiSnips snippets
mkdir /root/.vim/UltiSnips
cp $(pwd)/python.snippets  /root/.vim/UltiSnips

# restart
reboot -h 0
