#!/bin/bash
'''
###########################################################
# Script Name:			Setup RDP
# Creator:				Daniel Svoboda
# Description:			Automatic Setup of RDP ability into Ubuntu Desktop
# Date of Creation:		2016-11-15 17:25
# Last Modification:	2016-11-15 
# Modified by:			Daniel Svoboda
# Version:				1.0
# Notes:				http://c-nergy.be/blog/?p=9962
###########################################################
'''

# Download TigetVNCServer Deb Package
cd ~/Downloads
wget http://www.c-nergy.be/downloads/tigervncserver_1.6.80-4_amd64.zip

# cd to Downloads directory and unzip package
cd ~/Downloads && unzip tigervnc*

# Cleanup of unnecesarry zip file
sudo rm tiger*.zip

# Install TigerVNCServer incl. all dependencies
dpkg -i tigervnc*
apt-get install -f -y

# Install XRDP
apt-get install xrdp -y

# Backup startwm.sh and add '#xrdp multi-users \n unity \n' underneath 'fi'
sudo sed -i.bak '/fi/a #xrdp multi-users \nunity \n' /etc/xrdp/startwm.sh

