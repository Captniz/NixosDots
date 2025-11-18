#!/usr/bin/env bash

# Fetch Hyprland clients
clients=$(hyprctl clients -j)

# Extract class, title and address
list=$(echo "$clients" | jq -r '.[] | "\(.initialClass)|\(.title)|\(.address)"')

get_icon() { 
	class="$1" # Get closest matching .desktop file by filename, not by content 
	
	desktop=$(ls /run/current-system/sw/share/applications/*.desktop 2>/dev/null | grep -i "$class" | head -n1) 

	# If not found, try second chance fuzzy match 
	[ -z "$desktop" ] && desktop=$(ls /run/current-system/sw/share/applications/*.desktop 2>/dev/null | grep -i "$(echo "$class" | tr 'A-Z' 'a-z')" | head -n1) 
	[ -z "$desktop" ] && echo "" && return 

	icon_key=$(grep -E "^Icon=" "$desktop" | head -n1 | cut -d= -f2) 
	[ -z "$icon_key" ] && echo "" && return 

	icon=$(find /run/current-system/sw/share/icons -name "${icon_key}.png" -o -name "${icon_key}.svg" 2>/dev/null | head -n1) 
	[ -z "$icon" ] && icon=$(find /run/current-system/sw/share/pixmaps -name "${icon_key}.png" -o -name "${icon_key}.svg" 2>/dev/null | head -n1) 

	echo "$icon" 
}

echo "$(get_icon Alacritty)"

entries=""
addresses=()

while IFS="|" read -r class title addr; do
    addresses+=("$addr")
    icon=$(get_icon "$class")

    if [ -n "$icon" ]; then
        # Visible label + icon
        entries+="$class: $title\0icon\x1f$icon\n"
    else
        entries+="$class: $title\n"
    fi
done <<< "$list"

# Display menu and get index of selection
picked=$(echo -e "$entries" | rofi -dmenu -markup-rows -show-icons -p "Windows" -format i)

# Exit if nothing chosen
[ -z "$picked" ] && exit 0

# Get the address from array and focus that window
addr="${addresses[$picked]}"
hyprctl dispatch focuswindow "address:$addr"

