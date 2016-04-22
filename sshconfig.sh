#!/usr/bin/env bash

mkdir -p /home/vagrant/.ssh
# mitchellh is a developer at HashiCorp -- these are default keys
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
# Ensure we have the correct permissions set
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

sudo /usr/bin/perl -i -p -e 's/^#(AuthorizedKeysFile\s+\%h)/$1/' /etc/ssh/sshd_config

sudo service ssh restart

