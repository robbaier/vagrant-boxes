#!/bin/sh -eux

# Add repo
cat <<EOT >> /etc/yum.repos.d/MariaDB.repo
# MariaDB 10.3 CentOS repository list - created 2018-09-18 11:39 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOT

# Install MariaDB
yum -y install MariaDB-server MariaDB-client

systemctl enable mariadb;
systemctl start mariadb;
