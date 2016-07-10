# PedalPi - Raspberry

PedalPi implementation for Raspberry

## To "install" (use for development)

```bash
git clone --recursive https://github.com/PedalPi/WebService

sudo pip3 install virtualenv

virtualenv PedalPi
source ./PedalPi/bin/activate

pip3 install -r requirements.txt
```

## To run

```
source ./PedalPi/bin/activate
python3 start.py
```

## To send your changes from your PC to Raspberry

```
source ./PedalPi/bin/activate
pip3 install when-changed

rsync -Cravzp --delete-after <path to project>/PedalPi-Raspberry/ pi@<IP address>:<Raspberry path> --exclude-from=.gitignore

# Example use
#when-changed -vrs ./ rsync -Cravzp --delete-after $(pwd)/ pi@10.0.0.201:/home/pi/Desktop/share/PedalPi2 --exclude-from=.gitignore
```
