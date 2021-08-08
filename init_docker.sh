#!/bin/bash

set -e

# if you want uninstall old version of docker, uncomment blow commands
#yum remove docker \
#	docker-client \
#        docker-client-latest \
#        docker-common \
#        docker-latest \
#        docker-latest-logrotate \
#        docker-logrotate \
#        docker-engine 

# install docker engine
yum install -y yum-utils

yum-config-manager \
	--add-repo \
	https://download.docker.com/linux/centos/docker-ce.repo

yum clean all
yum makecache

yum install -yyy docker-ce docker-ce-cli containerd.io


# automic start when boot
systemctl enable docker

# start docker
systemctl start docker
