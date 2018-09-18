#!/bin/sh -eux

yum -y update;

# Install extra repos
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y;
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y;
yum install yum-utils -y;
yum-config-manager --enable remi-php72;

# Install build tools
yum install -y gcc gcc-c++ make autoconf automake kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils;
yum install -y unzip git git-core zlib zlib-devel patch readline libyaml-devel libffi-devel openssl-devel libtool bison curl;
