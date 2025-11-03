#!/bin/bash

MAX_WORKSPACES=5

# Custom class mappings
declare -A CLASS_MAP
CLASS_MAP["org.pwmt.zathura"]="Zath"
CLASS_MAP["Alacritty"]="Term"
CLASS_MAP["firefox"]="Web"
CLASS_MAP["code"]="Code"
CLASS_MAP["Cider"]="Song"
# Add more mappings as needed

# Get active workspace ID
active_ws=$(hyprctl activeworkspace -j | jq -r '.id')

# Get JSON of clients
json=$(hyprctl clients -j | jq -c '[.[] | {class: .initialClass, ws: .workspace.id}] | sort_by(.ws)[]')

# Initialize arrays
declare -A counts
declare -A classes

# Process JSON if not empty
if [ -n "$json" ]; then
    while read -r client; do
        cls=$(echo "$client" | jq -r '.class')
        ws=$(echo "$client" | jq -r '.ws')

        # Apply custom mapping if exists, else first 3 chars
        short_class="${CLASS_MAP[$cls]:-${cls:0:4}}"

        # Count windows per workspace
        counts[$ws]=$(( ${counts[$ws]:-0} + 1 ))

        # Keep first class seen for workspace
        if [ -z "${classes[$ws]}" ]; then
            classes[$ws]="$short_class"
        fi
    done <<< "$json"
fi

# Build output array
output_array=()
for ws in $(seq 1 $MAX_WORKSPACES); do
    cls="${classes[$ws]:-""}"
    extra=$(( counts[$ws]-1 ))
    [ "$extra" -lt 0 ] && extra=0
    third_field=$([ "$extra" -eq 0 ] && echo "" || echo "+${extra}")

    # Replace number with "x" if active workspace
    ws_display=$([ "$ws" -eq "$active_ws" ] && echo "X" || echo "$ws")

    # Wrap workspace in square brackets
    output_array+=("[\"[${ws_display}]\",\"${cls}\",\"${third_field}\"]")
done

# Join array elements with commas
output="["
output+=$(IFS=, ; echo "${output_array[*]}")
output+="]"

echo "$output"
