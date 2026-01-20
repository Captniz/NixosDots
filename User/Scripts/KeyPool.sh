#!/usr/bin/env bash

declare -A window_handlers=(
  [hyprland]=handle_hyplrand
  [Visual Studio Code]=handle_vscode
)

handle_hyplrand() {
  CONFIG="$HOME/.config/hypr/hyprland.conf"
  ENTRIES=()

  while IFS= read -r line; do
  # ✅ Only match bind, binde, bindm
    if [[ "$line" =~ ^(bind|binde|bindm)[[:space:]]*=\s*(.*)$ ]]; then
      bindtype="${BASH_REMATCH[1]}"
      rest="${BASH_REMATCH[2]}"

      # ✅ Split CSV safely into 4 parts
      IFS=',' read -r modkey seckey func command <<< "$rest"

      # ✅ Build display string for rofi
      ENTRY="$modkey + $seckey  →  $func ($command)"
      ENTRIES+=("$ENTRY")
  fi
  done < "$CONFIG"

  printf '%s\n' "${ENTRIES[@]}" | rofi -dmenu -i -p "Hypr Binds"
}

handle_vscode(){
  KEYBINDS="$HOME/.config/Code/User/keybindings.json"

  # Handle VSCodium automatically
  [[ ! -f "$KEYBINDS" ]] && KEYBINDS="$HOME/.config/VSCodium/User/keybindings.json"

  if [[ ! -f "$KEYBINDS" ]]; then
    echo "VS Code keybindings.json not found!"
    exit 1
  fi

  ENTRIES=()

  # ✅ Extract key, command, when safely via jq
  while IFS= read -r entry; do
    key=$(jq -r '.key' <<< "$entry")
    command=$(jq -r '.command' <<< "$entry")
    when=$(jq -r '.when // empty' <<< "$entry")

    if [[ -n "$when" ]]; then
      display="$key  →  $command  [$when]"
    else
      display="$key  →  $command"
    fi

    ENTRIES+=("$display")
  done < <(jq -c '.[]' "$KEYBINDS")

  # ✅ Launch rofi
  printf '%s\n' "${ENTRIES[@]}" | rofi -dmenu -i -p "VS Code Keybinds"
}

# Display menu and get index of selection
window=$(hyprctl activewindow -j | jq -r '.initialTitle')

# Exit if nothing chosen
[ -z "$window" ] && exit 0


if [[ -n "${window_handlers[$window]}" ]]; then
  "${window_handlers[$window]}"
else
  handle_hyplrand
fi