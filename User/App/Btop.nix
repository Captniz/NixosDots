{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
    };
  };
}