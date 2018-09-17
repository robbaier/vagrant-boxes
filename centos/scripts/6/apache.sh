#!/bin/sh -eux

# Install Apache
yum install httpd -y;

chkconfig httpd on;
service httpd start;
