#!/usr/bin/env bash

yum remove -y vim
yum install lua lua-devel -y
yum -y install ruby perl-devel python-devel ruby-devel perl-ExtUtils-Embed ncurses-devel
pip install httpie -q

http -d http://luajit.org/download/LuaJIT-2.0.4.tar.gz
tar -xzvf LuaJIT-2.0.4.tar.gz
cd LuaJIT-2.0.4
make
sudo make install
cd

git clone https://github.com/vim/vim.git --depth=1 && cd vim/
./configure  \
    --prefix=/usr/local \
    --enable-multibyte  \
    --with-tlib=tinfo  \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --with-ruby-command=/usr/bin/ruby \
    --with-features=huge \
    --with-luajit \
    --enable-luainterp=yes \
    --enable-fail-if-missing

make
sudo make install

ln -s /usr/local/lib/libluajit-5.1.so.2 /lib64/libluajit-5.1.so.2
