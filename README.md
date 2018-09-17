Vagrant Boxes
=====================

## Overview
This project uses [Packer](https://www.packer.io/) templates for building [Vagrant](https://www.vagrantup.com/) base boxes. You don't need to build these boxes to use them, they are published and publicly available on [Vagrant cloud](https://app.vagrantup.com/robbaier).

These boxes are intended to provide stable, current development environments with useful tools and configurations.

## What's Included
* Apache 2.2.15
* MySQL ([MariaDB](https://mariadb.org/) 10.3.9)
* PHP 7.2
  * [PHPUnit](https://phpunit.de/index.html)
  * [Phing](https://www.phing.info/)
  * [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)
  * [Composer](https://getcomposer.org/)
  * [XDebug](https://xdebug.org/)
* [Ruby](https://www.ruby-lang.org/en/) & [RVM](https://rvm.io/)
* [Node.js](https://nodejs.org/en/) & [npm](https://www.npmjs.com/)
* [Yarn](https://yarnpkg.com/en/)
* [Gulp](https://gulpjs.com/)
* [WP-CLI](https://wp-cli.org/)
* Git

### Using Public Boxes

Adding a box to Vagrant

```
$ vagrant box add robbaier/centos-6.10
```

Using a box in a Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.box = "robbaier/centos-6.10"
end
```

### Building Boxes

#### Requirements

- [Packer](https://www.packer.io/)
- [VirtualBox](https://www.virtualbox.org)
- [Vagrant Cloud account](https://www.vagrantup.com/docs/vagrant-cloud/) (optional)

#### Using packer

To build a CentOS 6.10 box:

```
$ cd centos
$ packer build centos-6.10-x86_64.json
```

Successfully built box files will be in the `builds` directory.

#### Vagrant Cloud

The build process includes configuration for the Vagrant Cloud post-processor. This uploads each successfully built box to Vagrant Cloud. This functionality requires a valid [authentication token](https://www.vagrantup.com/docs/vagrant-cloud/users/authentication.html#authenticating-tools) set in the `ATLAS_TOKEN` environment variable.

If you only intend to use these boxes locally, remove the vagrant-cloud post-processor section of the JSON file for the box you are building.