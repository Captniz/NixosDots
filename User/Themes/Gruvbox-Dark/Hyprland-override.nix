{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    wayland.windowManager.hyprland.settings = { 
        "$wallpaper" = lib.mkForce "99.png";
        "$activeBorder" = lib.mkForce "rgba(${colors.green}dd)";
    };
}