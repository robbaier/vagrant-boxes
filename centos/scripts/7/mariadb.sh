#!/bin/sh -eux

# Install MariaDB
yum -y install mariadb-server;

systemctl enable mariadb;
systemctl start mariadb;
