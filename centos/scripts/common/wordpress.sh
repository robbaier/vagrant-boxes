#!/bin/sh -eux

# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
/usr/local/bin/wp --info --allow-root --path=/vagrant;

# Install WP-CLI tab completion for Bash
curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash;
echo 'source /home/vagrant/wp-completion.bash' >> /home/vagrant/.bash_profile;

# Create WP-CLI config directory for vagrant user
mkdir /home/vagrant/.wp-cli;
chown vagrant:vagrant /home/vagrant/.wp-cli;
