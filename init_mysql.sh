#/bin/bash

set -u
set -e

# pre-request
yum install -y libaio
yum install -y ncurses-compat-libs


# install mysql
mkdir -p /root/rpm
cd /root/rpm
#curl -O https://repo.mysql.com//mysql80-community-release-el8-1.noarch.rpm
# use mirror 
curl -O https://mirrors.cloud.tencent.com/mysql/yum/mysql80-community-el8/mysql80-community-release-el8-1.noarch.rpm
yum install -y mysql80-community-release-el8-1.noarch.rpm
yum repolist enabled | grep "mysql.*-community.*"

# For (EL8 systems only) EL8-based systems such as RHEL8 and Oracle Linux 8,  Disabling the Default MySQL Module
yum module disable -y mysql

yum install -y mysql-community-server

# start mysql
systemctl start mysqld
systemctl status mysqld

mysql_secure_installation
