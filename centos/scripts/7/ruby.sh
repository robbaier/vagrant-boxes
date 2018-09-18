# Install RVM & Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL get.rvm.io | bash -s stable --ruby --auto-dotfiles;
source /home/vagrant/.rvm/scripts/rvm;
source /home/vagrant/.bashrc;

rvm reload;
rvm install ruby;
rvm --default use ruby;

# Cleanup Ruby stuff
rvm cleanup all;
