#!/usr/bin/env bash

# download
\wget https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.11.2.linux-amd64.tar.gz

mkdir -p /home/go

cat <<EOF >> ~/.zshrc
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=/home/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
EOF

source ~/.zshrc
