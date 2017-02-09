#!/usr/bin/env bash

# Update the sources list with the 
# QGIS libs so that we're not dependent
# on the really old versions in the main repos
sudo sh -c 'echo "# QGIS Repositories" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://qgis.org/ubuntugis xenial main" >> /etc/apt/sources.list'  
sudo sh -c 'echo "deb-src http://qgis.org/ubuntugis xenial main" >> /etc/apt/sources.list'  
# Not a real fan of this next line
# Needed for now since QGIS updates are way behind...
#sudo sh -c 'echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main" >> /etc/apt/sources.list'

# Add the QGIS signing key so that apt-get
# doesn't complain about missing public keys
# Note that these expire: gpg-2016 [expires: 2017-08-17]
wget -O - http://qgis.org/downloads/qgis-2016.gpg.key | gpg --import
gpg --fingerprint 073D307A618E5811
gpg --export --armor 073D307A618E5811 | sudo apt-key add -

# And update the repos and install QGIS
sudo apt-get update 
sudo apt-get install -y python-software-properties 
sudo apt-get install -y qgis python-qgis python-qgis-common qgis-plugin-grass saga
