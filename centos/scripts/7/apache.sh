#!/bin/sh -eux

# Install Apache
yum install httpd -y;

systemctl enable httpd;
systemctl start httpd;
