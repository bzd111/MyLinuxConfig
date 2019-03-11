#!/usr/bin/env bash

# 下载文件
wget https://install.direct/go.sh

# 执行文件
bash go.sh

# 启动
systemctl start v2ray

# 开机自启动
systemctl enable v2ray

# 客户端下载
# https://github.com/v2ray/v2ray-core/releases
