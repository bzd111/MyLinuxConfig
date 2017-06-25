#!/usr/bin/env bash

yum remove -y yum
yum install ncurses-devel
pip install httpie -q
http -d https://github.com/vim/vim/archive/master.zip
unzip master.zip
cd vim-master
cd src/
./configure \                                                                                                                                            139 ↵
    --prefix=/usr/local/ \
    --with-features=huge \
    --enable-multibyte \
    --enable-cscope=yes \
    --enable-rubyinterp=yes \
    --with-ruby-command=/usr/bin/ruby \
    --enable-luainterp=yes \
    --enable-pythoninterp=yes \
    --enable-tclinterp=yes \
    --enable-gui=auto \
    --enable-gnome-check \
    --enable-xim \
    --enable-fontset \
    --with-x \
    --with-compiledby=$USER

make
sudo make install
vim
