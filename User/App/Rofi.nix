{ config, lib, pkgs, userSettings, ...}:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font 12";
    theme = "/etc/nixos/User/Themes/Gruvbox-Dark/gruvbox-material.rasi";
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