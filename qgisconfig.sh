#!/usr/bin/env bash

# Update the sources list with the 
# QGIS libs so that we're not dependent
# on the really old versions in the main repos
sudo sh -c 'echo "# QGIS Repositories" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://qgis.org/ubuntugis trusty main" >> /etc/apt/sources.list'  
sudo sh -c 'echo "deb-src http://qgis.org/ubuntugis trusty main" >> /etc/apt/sources.list'  

# Add the QGIS signing key so that apt-get
# doesn't complain about missing public keys
wget -O - http://qgis.org/downloads/qgis-2015.gpg.key | gpg --import
gpg --fingerprint 3FF5FFCAD71472C4
gpg --export --armor 3FF5FFCAD71472C4 | sudo apt-key add -

# And update the repos and install QGIS
sudo apt-get update 
sudo apt-get install -y python-software-properties 
sudo apt-get install -y qgis python-qgis python-qgis-common qgis-plugin-grass saga


