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
    "$wallpaper" = lib.mkForce "~/Images/gruvbox-wallpapers/wallpapers/anime/ghibli-japanese-walled-garden.png";
    "$activeBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.green}dd)";
  };
}
