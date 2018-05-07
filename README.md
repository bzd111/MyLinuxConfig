# My Linux Config

由于工作中多使用Centos，参考了王宁宁大神的Linux配置，所以整理了一下，如果是ubuntu的话，可以直接去点下面的连接

[参考](https://github.com/PegasusWang/linux_config)

安装命令

```
git clone https://github.com/bzd111/MyLinuxConfig.git myconfig && sh ./myconfig/install.sh
```

使用单个脚本,以mysql为例

```
bash -c "$(curl -L -k https://raw.githubusercontent.com/bzd111/MyLinuxConfig/master/software/mysql_install.sh)"
```