{ config, lib, pkgs, ...}:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font 12";
    theme = "/etc/nixos/extConfigs/rofi/gruvbox-material.rasi";
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