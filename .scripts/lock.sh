#!/bin/zsh

LAPTOP="LVDS1"
DOCK_1="LVDS1 HDMI3"
DOCK_2="LVDS1 DP2 HDMI3"
DESKTOP="DP1 HDMI2"
TEXT='LOCKED_'
IMAGE=/tmp/screenshot.png

xdpyinfo -ext XINERAMA | sed '/^  head #/!d;s///' |
while IFS=' :x@,' read i w h x y; do
    maim --geometry=${w}x${h}+${x}+${y} /tmp/screenshot_$i.png
    convert /tmp/screenshot_$i.png -scale 10% -scale 1000% -fill black -colorize 50% -font 3270-Medium-Nerd-Font-Complete-Mono -pointsize 150 -gravity Center -fill white -annotate +0+0 "$TEXT" /tmp/screenshot_$i.png
done

SCREENS=($(xrandr --query | grep " connected" | cut -d" " -f1))
SCREENSTR=$(echo "$SCREENS[*]" | tr -s " ")

if [[ "$SCREENSTR" == "$LAPTOP" ]] ; then
    mv /tmp/screenshot_0.png $IMAGE
elif [[ "$SCREENSTR" == "$DOCK_1" ]] ; then
    convert -gravity center -background black +append /tmp/screenshot_1.png /tmp/screenshot_0.png $IMAGE
elif [[ "$SCREENSTR" == "$DOCK_2"  ]] ; then
    convert -gravity center -background black +append /tmp/screenshot_0.png /tmp/screenshot_1.png $IMAGE
elif [[ "$SCREENSTR" == "$DESKTOP"  ]] ; then
    convert -gravity center -background black +append /tmp/screenshot_1.png /tmp/screenshot_0.png $IMAGE
fi
playerctl stop &> /dev/null
i3lock -uei $IMAGE
rm /tmp/screenshot*.png
xset dpms force off
