#!/usr/bin/env bash

# http://wiki.linuxaudio.org/wiki/raspberrypi
for cpu in /sys/devices/system/cpu/cpu[0-9]*; do echo -n performance \
| sudo tee $cpu/cpufreq/scaling_governor; done

## Stop the ntp service
sudo service ntp stop

## Stop the triggerhappy service
#sudo service triggerhappy stop

## Stop the dbus service. Warning: this can cause unpredictable behaviour when running a desktop environment on the RPi
sudo service dbus stop

## Stop the console-kit-daemon service. Warning: this can cause unpredictable behaviour when running a desktop environment on the RPi
sudo killall console-kit-daemon

## Stop the polkitd service. Warning: this can cause unpredictable behaviour when running a desktop environment on the RPi
sudo killall polkitd

## Only needed when Jack2 is compiled with D-Bus support (Jack2 in the AutoStatic RPi audio repo is compiled without D-Bus support)
#export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket

# Stop ethernet
#sudo service ifplugd stop
#sudo killall ifplugd
#sudo service networking stop

sudo dphys-swapfile swapoff
#sudo dphys-swapfile uninstall
sudo sh -c "echo 'CONF_SWAPSIZE=0' > /etc/dphys-swapfile"

