export LANG=zh_CN.UTF-8
#!/bin/bash

KNOWN_DISTRIBUTION="(Ubuntu|RedHat|CentOS|)"
DISTRIBUTION=$(lsb_release -d 2>/dev/null | grep -Eo $KNOWN_DISTRIBUTION  ||
    grep -Eo $KNOWN_DISTRIBUTION /etc/issue 2>/dev/null || grep -Eo
$KNOWN_DISTRIBUTION /etc/Eos-release 2>/dev/null || uname -s)


# determine os
if [ $DISTRIBUTION = "Darwin" ]; then
    printf "\033[31mThis script does not support installing on the Mac.Will be available soon"
    exit 1;

elif [ -f /etc/debian-release -o "$DISTRIBUTION" == "Ubuntu" ]; then
    OS="Ubuntu"
elif [ -f /etc/redhat-release -o "$DISTRIBUTION" == "RedHat" -o "$DISTRIBUTION" == "CentOS" ]; then
    OS="CentOS"
fi

# Root user detection
if [ $(echo "$UID") = "0" ]; then
    sudo_cmd=''
else
    sudo_cmd='sudo'
fi

# start install
if [ $OS = "CentOS" ]; then
    cd centos
    $sudo_cmd sh centos_install.sh
elif [ $OS = "Ubuntu" ]; then
    cd ubuntu
    $sudo_cmd sh ubuntu_install.sh
else
    printf "\033[31mYour OS are not supported by this install script.\033[0m\n"
    exit;
fi
