#!/bin/zsh
xrdb ~/.Xdefault
pulseaudio -D
setxkbmap de us
exec i3
