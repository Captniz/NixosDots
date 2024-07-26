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
    #plugins = [ pkgs.rofi-calc pkgs.rofi-file-browser ];
    font = "FiraCode Nerd Font 12";
    extraConfig = {
      "display-ssh"=    "";
      "display-run"=    "";
      "display-drun"=   "";
      "display-window"= "";
      "display-combi"=  "";
      "display-calc"=  " ";
      "show-icons"=     true;
    };
  };
}