#!/bin/bash

set -ue
set -o pipefail

TMP_DIR="/root/tmp"


cd $TMP_DIR

wget https://mirrors.bfsu.edu.cn/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
if [ $? -ne 0 ]; then
	echo 'download flume install package fail'
fi

wget http:///www.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz.asc
if [ $? -ne 0 ]; then
	echo 'download flume asc file fail'
fi

wget https://downloads.apache.org/flume/KEYS
if [ $? -ne 0 ]; then
	echo 'download flume verify KEYS fail'
fi

gpg --import KEYS
gpg --verify apache-flume-1.9.0-bin.tar.gz.asc apache-flume-1.9.0-bin.tar.gz






