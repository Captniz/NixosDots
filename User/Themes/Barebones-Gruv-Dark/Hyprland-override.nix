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
    "$activeBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.blue}ff)";
    "$inactiveBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.black}00)";
    general = {
      gaps_in = lib.mkForce 5;
      gaps_out = lib.mkForce 6;
    };
    decoration = lib.mkForce {
      active_opacity = 0.85;
      inactive_opacity = 0.85;
      rounding = 0;
      blur = {
        enabled = true;
        size = 9;
        new_optimizations = true;
        passes = 3;
        ignore_opacity = true;
      };
    };
  };
}
