# Usage
# sh ./sync.sh <user>@<ip address> <rpi folder>

rsync -Cravzp --delete-after $(pwd)/ $1:$2 --exclude-from=.gitignore
killall notify-osd
notify-send "Sync task completed" "$(date)"
