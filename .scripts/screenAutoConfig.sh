#!/bin/zsh

LAPTOP="eDP1"
MATHCCES="eDP1 DP2-2"
AINT="eDP1 HDMI2"

SCREENS=($(xrandr --query | grep " connected" | cut -d" " -f1 | tr '\r\n' ' ' | sed '$s/ $/\n/'))
SCREENSTR=$(echo "$SCREENS[*]" | tr -s " ")

if [[ "$SCREENSTR" == "$LAPTOP" ]] ; then
    ~/.scripts/screenLayouts/laptop.sh
elif [[ "$SCREENSTR" == "$MATHCCES" ]] ; then
    ~/.scripts/screenLayouts/dock_1.sh
elif [[ "$SCREENSTR" == "$AINT" ]] ; then
    ~/.scripts/screenLayouts/aint.sh
else 
    echo "no valid config found"
fi
