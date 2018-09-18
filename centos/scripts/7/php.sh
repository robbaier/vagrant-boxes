#!/bin/sh -eux

# Install PHP
yum install php php-common php-mysqlnd php-gd php-xml php-cli php-curl php-zip php-fileinfo php-mbstring php-pecl-mcrypt php-xmlrpc php-pear php-soap php-devel -y;

# Install PHPUnit
wget -O phpunit https://phar.phpunit.de/phpunit-7.phar;
chmod +x phpunit;
mv phpunit /usr/local/bin/phpunit;

# Install Phing
pear channel-discover pear.phing.info;
pear install phing/phing;

# Install PHP CodeSniffer
pear install PHP_CodeSniffer;

# Install Composer
curl -sS https://getcomposer.org/installer | php;
mv composer.phar /usr/local/bin/composer;

# Install Xdebug
pecl install Xdebug;
chmod +x /usr/lib64/php/modules/xdebug.so;

# Update php.ini
cat <<EOT >> /etc/php.ini

[xdebug]
zend_extension="/usr/lib64/php/modules/xdebug.so"
xdebug.remote_enable = 1

EOT
