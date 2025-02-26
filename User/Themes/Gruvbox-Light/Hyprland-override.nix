{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
in
{
  wayland.windowManager.hyprland.settings = {
    "$wallpaper" = lib.mkForce "~/Images/gruvbox-wallpapers/wallpapers/mix/random.jpg";
    "$activeBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.blue}ff)";
    decoration.active_opacity = lib.mkForce 0.80;
    decoration.inactive_opacity = lib.mkForce 0.70;
  };
}
