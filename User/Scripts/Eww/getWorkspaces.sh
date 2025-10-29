#!/bin/sh

# Get the list of workspaces, with a maximum of 10 workspaces
ws=()

# Initialize the workspace array with the "" symbol for up to 10 workspaces
for i in {1..10}
do
    ws[$i]="\"\""
done

# Read the current active workspaces and update the array with ""
# but limit it to 10 workspaces
while read -r line
do
    # If the workspace index is within the range of 1 to 10, update it
    if [ "$line" -ge 1 ] && [ "$line" -le 10 ]; then
        ws[$line]="\"\""
    fi
done < <(hyprctl workspaces -j | jq -r '.[] | .name')

# Get the active workspace from the monitor and update the corresponding index
# Ensure the workspace index is within the range 1 to 10
active_workspace=$(hyprctl monitors -j | hyprctl activeworkspace -j | jq -r '.id')
if [ "$active_workspace" -ge 1 ] && [ "$active_workspace" -le 10 ]; then
    ws[$active_workspace]="\"\""
fi

# Output the workspace symbols as a comma-separated string, limited to the first 10 workspaces
echo "[$(echo ${ws[@]:1:10} | sed 's/ /,/g')]"
