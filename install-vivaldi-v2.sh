#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author  :   Erik Dubois
# Website :   http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Install libcurl3 if available (needed on older Mint 18.x)
sudo apt-get install -y libcurl3 || true

# Fetch the latest Vivaldi stable version number dynamically
VI_VERSION=$(curl -s https://vivaldi.com/download/ | grep -oP 'vivaldi-stable_\K[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1)

if [ -z "$VI_VERSION" ]; then
    echo "Could not detect latest Vivaldi version, falling back to last known stable..."
    VI_VERSION="6.9.3447.41"
fi

echo "Installing Vivaldi stable $VI_VERSION"

rm -f /tmp/vivaldi-stable.deb

wget "https://downloads.vivaldi.com/stable/vivaldi-stable_${VI_VERSION}-1_amd64.deb" -O /tmp/vivaldi-stable.deb
sudo dpkg -i /tmp/vivaldi-stable.deb
sudo apt-get -f -y install

rm -f /tmp/vivaldi-stable.deb

##################################################################################################################

echo "################################################################"
echo "###################     vivaldi installed    ###################"
echo "################################################################"


