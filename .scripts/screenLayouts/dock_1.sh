#!/bin/zsh
xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --primary --mode 1920x1200 --pos 1366x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x208 --rotate normal --output VGA1 --off
feh --bg-scale ~/.wallpaper/wallpaper_dock.jpg
numlockx
#i3-msg 'workspace 8; exec /usr/bin/thunderbird; move workspace to output left'
#i3-msg 'workspace 9; exec /usr/bin/rambox; move workspace to output left'
#i3-msg 'workspace 1; move workspace to output right'