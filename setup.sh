#!/bin/bash
_now=$(date +"%Y-%m-%d_%H.%M.%S")
apt-get update
apt-get install -y gcc g++ make subversion
mkdir /tmp/setup_boblight/
mv * /tmp/setup_boblight/
cd ..
rm -rf boblight_setup/
mv /etc/boblight.conf /etc/boblight.conf_$_now.bak
cp /tmp/setup_boblight/boblight.conf /etc/boblight.conf
chmod 755 /tmp/setup_boblight/create_boblight_cron.sh
cd /tmp/setup_boblight/
./create_boblight_cron.sh
cd ~
svn checkout http://boblight.googlecode.com/svn/trunk/ ~/boblight_source
cd ~/boblight_source/
./configure --without-portaudio --without-x11 --without-libusb
# make; make install
rm -rf ~/boblight_source/
ldconfig