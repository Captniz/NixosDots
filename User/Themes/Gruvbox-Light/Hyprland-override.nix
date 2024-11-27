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
    "$wallpaper" = lib.mkForce "~/Images/gruvbox-wallpapers/wallpapers/mix/gruv-sushi-streets.jpg";
    "$activeBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.blue}ff)";
  };
}
