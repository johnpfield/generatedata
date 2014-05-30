#!/usr/bin/env bash
#
# maintainer: jfield@gopivotal.com
# date: May 28, 2014
# version: 0.1
#
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password dangerous'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password dangerous'

sudo apt-get install -y -q mysql-client
sudo apt-get install -y -q mysql-server
sudo apt-get install -y -q apache2
sudo apt-get install -y -q libapache2-mod-php5
sudo apt-get install -y -q php5-mysql
sudo apt-get install -y -q git

sudo a2enmod php5

sudo rm -rf /var/www
sudo ln -fs /vagrant /var/www

#
# The following line will edit the mysql configuration so that
# we can connect to the mysql server that is running on the guest from the 
# local machine, e.g. from a command prompt on your laptop, or your browser, running
# on your laptop.  Without this, mysql is not listening for remote connections
# and you could only connect from within the guest.
# 
sudo sed -e '/bind-address/ s/^#*/#/' -i /etc/mysql/my.cnf

#
# Create the username and database that we need in mysql.
#
sudo mysql -u root -pdangerous < /vagrant/create-database.sql

sudo service mysql restart
sudo service apache2 restart

