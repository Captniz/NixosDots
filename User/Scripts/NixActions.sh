#!/usr/bin/env bash

set -euo pipefail

# update-showlog = "cat /var/log/nixos-update.log | less";
# gc-showlog = "cat /var/log/nixos-gc.log | less";
# home-listgen = "home-manager generations";
# user-listgen = "nix-env --list-generations";
# system-listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
# system-gc = "${userSettings.scriptsPath}/GarbageCollector.sh";
# system-update = "${userSettings.scriptsPath}/SystemUpdate.sh";
# flakeup = "nix flake update --flake /etc/nixos";
# homeup = "home-manager switch --flake /etc/nixos --impure";
# nixup = "sudo nixos-rebuild switch --flake /etc/nixos";
# nixconfigure = "code /etc/nixos";
# optimise-store = "sudo nix-store --optimise";

all=(systemup homeup flakeup config gc upgrade system-gen home-gen user-gen gc-log upgrade-log)

# Text legends
declare -A texts=(
  [systemup]="Update NixOS system"
  [homeup]="Update home-manager configuration"
  [flakeup]="Update flake inputs"
  [config]="Edit NixOS configuration"
  [gc]="Call garbage collector"
  [upgrade]="Upgrade NixOS system"
  [system-gen]="List system generations"
  [home-gen]="List home-manager generations"
  [user-gen]="List user generations"
  [gc-log]="View NixOS garbage collector log"
  [upgrade-log]="View NixOS upgrade log"
)

# Icons (Nerd Font)
declare -A icons=(
  [systemup]=" - 󱋆"
  [homeup]=" - 󱅙"
  [flakeup]=" - 󰷈"
  [config]=""
  [gc]=""
  [upgrade]="󰚰"
  [system-gen]=" - 󰍹"
  [home-gen]=" - "
  [user-gen]=" - "
  [gc-log]="  "
  [upgrade-log]="󰚰  "
)

# Actions
declare -A actions=(
  [systemup]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh sh /etc/nixos/User/Scripts/Nixup.sh"
  [homeup]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh sh /etc/nixos/User/Scripts/Homeup.sh"
  [flakeup]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh sh /etc/nixos/User/Scripts/Flakeup.sh"
  [config]="code /etc/nixos"
  [gc]="alacritty -e sh /etc/nixos/User/Scripts/GarbageCollector.sh 7"
  [upgrade]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh sudo sh /etc/nixos/User/Scripts/SystemUpdate.sh"
  [system-gen]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh sudo nix-env -p /nix/var/nix/profiles/system --list-generations"
  [home-gen]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh home-manager generations"
  [user-gen]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh nix-env --list-generations"
  [gc-log]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh less /var/log/nixos-gc.log"
  [upgrade-log]="alacritty -e sh /etc/nixos/User/Scripts/RunHold.sh less /var/log/nixos-update.log"
)

# Build menu list for rofi
menu=""
for k in "${all[@]}"; do
  menu+="${icons[$k]}  ${texts[$k]}"$'\n'
done

menu="${menu%$'\n'}"  # Remove trailing newline

# Pick option
selected=$(echo -e "$menu" | rofi -dmenu -format i -p " System actions" )


# Exit if nothing selected
[[ -z "${selected}" ]] && exit 0

# Run the corresponding action
key="${all[$selected]}"
eval "${actions[$key]}"
