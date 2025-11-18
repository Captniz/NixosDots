#!/usr/bin/env bash

# Display menu and get index of selection
picked=$(echo " Select input
󰓃 Select output" | rofi -dmenu -markup-rows -p "Options:" -format i)

# Exit if nothing chosen
[ -z "$picked" ] && exit 0

if [ "$picked" -eq 0 ]; then
	rofi-pulse-select source
elif [ "$picked" -eq 1 ]; then
	rofi-pulse-select sink
fi
