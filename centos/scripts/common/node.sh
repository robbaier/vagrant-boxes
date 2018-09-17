#!/bin/sh -eux

# Install Node
curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -;
yum -y install nodejs;

# Update to latest version of NPM
npm install npm@latest -g;

# Install Yarn
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo;
yum -y install yarn;

# Install Gulp
npm install -g gulp;
