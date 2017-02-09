#!/bin/bash

# How to install:
# > git clone https://github.com/kingsgeocomp/install-gis-mac.git
# > install-gis-ubuntu/install-gis-mac.sh

GDAL="N" # Install GDAL from source
INSTALLPY="Y" # Install Python & Py-GIS tools

############################################
############### Install GDAL ###############
############################################
PROJ4INSTALLED=1
GEOSINSTALLED=1
if [ "$PROJ4INSTALLED" = 0 ] && [ "$GEOSINSTALLED" = 0 ]; then 
	# PROJ4INSTALLED=$(dpkg-query -W --showformat='${Status}\n' libproj-dev 2>/dev/null | grep -c "ok installed")
	# GEOSINSTALLED=$(dpkg-query -W --showformat='${Status}\n' libgeos++-dev 2>/dev/null | grep -c "ok installed")
	printf "\n** Installing Lib-Proj and Lib-GEOS++...\n"
	sudo apt-get install -y libproj-dev libgeos++-dev
fi

# Now for GDAL
if [ "$GDAL" = "Y" ]; then
	printf "\n** Installing GDAL...\n"
	FLAV=$(lsb_release -c | awk 'BEGIN { FS="\t" }; {print $2}') 
	if [ $FLAV = "xenial" ]; then
  	sudo apt-get install -y gdal-bin libgdal-dev libgdal1-dev 
	else
		# In case we're not there already -- 
		# helps with GDAL script below
		cd install-gis-ubuntu/
  	bash install-gdal.sh
	fi
else 
	printf "\n** Skipping GDAL installation...\n"
fi

############################################
### Python Geographic Data Science Stack ###
############################################
if [ "$INSTALLPY" = "Y" ]; then
	printf "\n** Switching to Python GDS stack...\n"
	git clone https://github.com/darribas/gds_env.git
	cd gds_env
	conda update --yes conda
	conda install --yes psutil yaml pyyaml
	printf "** Installing GDS stack...\n"
	conda-env create -f install_gds_stack.yml
	conda install --yes basemap
	conda install --yes -c conda-forge pysal=1.13.0
	conda install --yes -c conda-forge folium
	conda install --yes -c conda-forge beautifulsoup4
	conda install --yes html5lib
	conda create --name spats --clone gds_test
else
	printf "** Skipping Python...\n"
fi

# EOF from: http://stackoverflow.com/questions/10969953/
cat <<-EOF
**************
All done.
Type: 'source activate spats' before running Python in the Terminal.
**************
EOF
