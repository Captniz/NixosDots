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
    "$activeBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.gray}ff)";
    "$inactiveBorder" = lib.mkForce "rgba(${lib.strings.removePrefix "#" colors.bg0}ff)";
    general = {
      gaps_in = lib.mkForce 4;
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
    animations.animation = lib.mkForce [
      "windowsIn, 1, 6, myBezier, slide"
      "windowsOut, 1, 6, myBezier, slide"
      "windowsMove, 1, 6, myBezier, slide"
      "border, 1, 10, default"
      "fadeIn, 0"
      "fadeOut, 1, 8, default"
      "fadeLayersIn, 0"
      "fadeLayersOut, 1, 8, default"
      "fadePopupsIn, 0"
      "fadePopupsOut, 1, 8, default"
      "workspaces, 1, 4, myBezier, slide"
      "layersIn, 1, 4, myBezier, slide"
      "layersOut, 1, 2, myBezier, slide"
    ];
  };
}
