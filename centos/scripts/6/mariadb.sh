#!/bin/sh -eux

# Add repo
cat <<EOT >> /etc/yum.repos.d/MariaDB.repo
# MariaDB 10.3 CentOS repository list - created 2018-09-14 04:40 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos6-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOT

# Install MariaDB
yum -y install MariaDB-server MariaDB-client

chkconfig mysql on;
/etc/init.d/mysql start;
