# My Linux Config

由于工作中多使用 Centos，参考了王宁宁大神的 Linux 配置，所以整理了一下，如果是 ubuntu 的话，可以直接去点下面的连接

[参考](https://github.com/PegasusWang/linux_config)

安装命令

```
git clone https://github.com/bzd111/MyLinuxConfig.git myconfig && sh ./myconfig/install.sh
```

使用单个脚本,以 mysql 为例

```
bash -c "$(curl -L -k https://raw.githubusercontent.com/bzd111/MyLinuxConfig/master/software/mysql_install.sh)"
```

[推荐一篇文章](https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/)
