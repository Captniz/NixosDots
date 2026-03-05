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
    "$activeBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.blue}dd)";
  };
}
