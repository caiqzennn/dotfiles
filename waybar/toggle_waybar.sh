#!/bin/bash

if pgrep waybar > /dev/null; then
    killall waybar
else
    MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')
    HYPRLAND_INSTANCE_SIGNATURE=$HYPRLAND_INSTANCE_SIGNATURE waybar -m "$MONITOR" & disown
fi
