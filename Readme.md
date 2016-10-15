# PedalPi - Raspberry

PedalPi implementation for Raspberry

## To "install" (use for development)

```bash
git clone --recursive https://github.com/PedalPi/PedalPi-Raspberry --depth=1

sudo pip3 install virtualenv

virtualenv -p python3 PedalPi
source ./PedalPi/bin/activate

pip3 install -r requirements.txt
```

## To run

```
source ./PedalPi/bin/activate
python3 start.py
```

## To send your changes from your PC to Raspberry

First, configure

```
source ./PedalPi/bin/activate
pip3 install when-changed

# For passwordless
#https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md
```

Now, active

```
when-changed -v -r -1 -s . sh ./sync.sh <user>@<ip address> <raspberry folder to send files>
# example when-changed -v -r -1 -s . sh ./sync.sh pi@10.0.0.201 /home/pi/Desktop/share/PedalPi
```
