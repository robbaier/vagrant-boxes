#!/bin/sh -eux

service httpd restart;
/etc/init.d/mysql restart;
