{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
{
  imports = [
    ../Themes/${userSettings.theme}/Rofi-override.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font 12";
    extraConfig = {
      "display-ssh"=    "";
      "display-run"=    "";
      "display-drun"=   "";
      "display-window"= "";
      "display-combi"=  "";
      "show-icons"=     true;
    };
  };
}