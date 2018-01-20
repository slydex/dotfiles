#!/bin/zsh

if [ $(cmus-remote -Q | head -n 1 | cut -d " " -f2) == "playing" ]; then
    artist=$( cmus-remote -Q | grep "tag artist " | sed s/"tag artist "/""/g )
    title=$( cmus-remote -Q | grep "tag title " | sed s/"tag title "/""/g )
    album=$( cmus-remote -Q | grep "tag album " | sed s/"tag album "/""/g )
    notify-send "Now Playing:" "$title by $artist" -u normal
elif [ $(cmus-remote -Q | head -n 1 | cut -d " " -f2) == "paused" ]; then
    artist=$( cmus-remote -Q | grep "tag artist " | sed s/"tag artist "/""/g )
    title=$( cmus-remote -Q | grep "tag title " | sed s/"tag title "/""/g )
    album=$( cmus-remote -Q | grep "tag album " | sed s/"tag album "/""/g )
    notify-send "Paused:" "$title by $artist" -u normal
elif [ $(cmus-remote -Q | head -n 1 | cut -d " " -f2) == "stopped" ]; then
    notify-send "Stopped" -u normal
fi
