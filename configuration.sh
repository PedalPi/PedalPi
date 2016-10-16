#!/usr/bin/env bash

# http://rpi.autostatic.com/
wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/autostatic-audio-raspbian.list http://rpi.autostatic.com/autostatic-audio-raspbian.list
sudo apt-get update

sudo apt-get --no-install-recommends install jackd2

# Plugins
sudo apt-get update
sudo apt-get install guitarix calf-plugins -y --no-install-recommends

# Moddevices
cd ~/Desktop
git clone https://github.com/moddevices/mod-host.git
cd mod-host

sudo apt-get install -f
sudo apt-get install libjack-jackd2-dev liblilv-dev libargtable2-dev libreadline-dev lilv-utils -y
make
cd ~/Desktop

# Lilv
# See https://github.com/moddevices/lilvlib/blob/master/build-python3-lilv.sh
# See https://github.com/moddevices/lilvlib/blob/master/docker/trusty_python34.docker
#sudo apt-get install --no-install-recommends debhelper devscripts dpkg-dev git pkg-config python3-all-dev python3-numpy subversion swig libpcre3-dev -y
#git clone
#git clone https://github.com/moddevices/lilvlib lilvlib --depth=1
#cd lilvlib
#echo "I need create a patch for ./build-python3-lilv.sh changes (https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=139091&p=p934640#p934640)"
#sh ./build-python3-lilv.sh
#sudo dpkg -i python3-lilv_0.22.1+git20160613_armhf.deb

mkdir lilv
cd lilv

wget http://lv2plug.in/spec/lv2-1.14.0.tar.bz2
tar -jxvf lv2-1.14.0.tar.bz2
cd lv2-1.14.0/
./waf configure && ./waf build -j2 && sudo ./waf install
cd ..

wget wget http://git.drobilla.net/cgit.cgi/sord.git/snapshot/sord-0.14.0.tar.gz
tar -xvf sord-0.14.0.tar.gz
cd sord-0.14.0/
./waf configure && ./waf && sudo ./waf install
cd ..

wget http://git.drobilla.net/cgit.cgi/lilv.git/snapshot/lilv-0.24.0.tar.gz
tar -xvf lilv-0.24.0.tar.gz
cd lilv-0.24.0/
./waf configure && ./waf && sudo ./waf install

# PedalPi - Raspberry
# Read README.md  https://github.com/PedalPi/PedalPi-Raspberry
cd ~/Desktop
git clone --recursive https://github.com/PedalPi/PedalPi-Raspberry --depth=1
cd PedalPi-Raspberry

sudo pip3 install virtualenv

virtualenv -p python3 PedalPi
source ./PedalPi/bin/activate

pip3 install -r requirements.txt


