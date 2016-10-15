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

# PedalPi - Raspberry
# Read README.md  https://github.com/PedalPi/PedalPi-Raspberry
cd ~/Desktop
git clone --recursive https://github.com/PedalPi/PedalPi-Raspberry --depth=1
cd PedalPi-Raspberry

sudo pip3 install virtualenv

virtualenv -p python3 PedalPi
source ./PedalPi/bin/activate

pip3 install -r requirements.txt


