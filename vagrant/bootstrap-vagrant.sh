#!/usr/bin/env bash

sudo apt-get dist-upgrade -y
sudo apt-get install git -y

if [ ! -f Miniconda-3.6.0-Linux-x86_64.sh ]; then
    wget http://repo.continuum.io/miniconda/Miniconda-3.6.0-Linux-x86_64.sh
    chmod +x Miniconda-3.6.0-Linux-x86_64.sh
fi

./Miniconda-3.6.0-Linux-x86_64.sh -b -p /home/vagrant/miniconda
export PATH=/home/vagrant/miniconda/bin:$PATH
echo "export PATH=/home/vagrant/miniconda/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

wget https://raw.githubusercontent.com/kingsgeocomp/install-gis-ubuntu/master/install-gis-mac.sh -O install-gis-mac.sh
chmod +x ./install-gis-mac.sh
./install-gis-mac.sh

#chmod +x /vagrant/install.sh
#/vagrant/install.sh

#wget http://darribas.org/gds15/content/infrastructure/install_gds_stack_unix.sh -O install_gds_stack_unix.sh
#chmod +x install_gds_stack_unix.sh
#./install_gds_stack_unix.sh
