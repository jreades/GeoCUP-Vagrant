#!/usr/bin/env bash

# HOW TO GET STARTED
# ==================
# STEP 1. Configure Sudoers file
#> sudo EDITOR=vi visudo
# Add at the end of the file:
#> vagrant ALL=(ALL) NOPASSWD:ALL
# Run the foloowing from the Terminal with a 
# clean install of Ubuntu 64-bit Linux.
#> wget http://bit.ly/1TrDeMC -O bootstrap.sh
#> chmod +x bootstrap.sh 
#> sudo sh bootstrap.sh

sudo apt-get update -y 
sudo apt-get dist-upgrade -y
sudo apt-get install -y linux-headers-$(uname -r) build-essential dkms
sudo apt-get install -y git
sudo apt-get install -y openssh-server

# Work out VirtualBox version -- can only be done later
# VBOX=$(VBoxClient --version | awk '{split($0,a,"r"); print a[1]}')
VBOX='5.0.16'

wget http://download.virtualbox.org/virtualbox/$VBOX/VBoxGuestAdditions_$VBOX.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_$VBOX.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_$VBOX.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions 

wget https://raw.githubusercontent.com/jreades/GeoCUP-Vagrant/master/sshconfig.sh 
wget https://raw.githubusercontent.com/jreades/GeoCUP-Vagrant/master/tidy.sh

chmod +x sshconfig.sh tidy.sh
sudo sh sshconfig.sh
sudo sh qgisconfig.sh 
sudo sh tidy.sh

sudo shutdown -h now 

# When the machine is shut down, we can now 
# compress the VDI file to save additional 
# disk space.
# Linux:
#> vboxmanage modifyhd /path/to/thedisk.vdi --compact
# Mac:
#> VBoxManage modifyhd /path/to/thedisk.vdi --compact
# Windows:
#> VBoxManage.exe modifyhd c:\path\to\thedisk.vdi --compact

