#!/usr/bin/env bash

sudo apt-get update -y 
#sudo apt-get dist-upgrade -y

# Work out VirtualBox version
vboxv = $(VBoxClient --version | awk '{split($0,a,"r"); print a[1]}')

sudo apt-get install linux-headers-$(uname -r) build-essential dkms
wget http://download.virtualbox.org/virtualbox/$(VBoxClient --version | awk '{split($0,a,"r"); print a[1]}')/VBoxGuestAdditions_$(VBoxClient --version | awk '{split($0,a,"r"); print a[1]}').iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_$(VBoxClient --version | awk '{split($0,a,"r"); print a[1]}').iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_$(VBoxClient --version | awk '{split($0,a,"r"); print a[1]}').iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions 

sudo apt-get install -y git
sudo apt-get install -y openssh-server
