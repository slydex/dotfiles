#!/bin/zsh

LAPTOP="LVDS1"
DOCK_1="LVDS1 HDMI3"
DOCK_2="LVDS1 DP2 HDMI3"
DESKTOP="DP1 HDMI2"

SCREENS=($(xrandr --query | grep " connected" | cut -d" " -f1))
SCREENSTR=$(echo "$SCREENS[*]" | tr -s " ")

if [[ "$SCREENSTR" == "$LAPTOP" ]] ; then
    ~/.scripts/screenLayouts/laptop.sh
elif [[ "$SCREENSTR" == "$DOCK_1" ]] ; then
    ~/.scripts/screenLayouts/dock_1.sh
elif [[ "$SCREENSTR" == "$DOCK_2" ]] ; then
    ~/.scripts/screenLayouts/dock_2.sh
elif [[ "$SCREENSTR" == "$DESKTOP" ]] ; then
    ~/.scripts/screenLayouts/desktop.sh
fi
