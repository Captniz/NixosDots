{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
{
  imports = [
    ../Themes/${userSettings.theme}/Rofi-override.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
    modes = [
      "window"
      "drun"
      "run"
      "ssh"
      "calc"
      "emoji"
      "keys"
    ];
    font = "FiraCode Nerd Font 12";
    extraConfig = {
      "display-ssh" = "";
      "display-run" = "";
      "display-drun" = "";
      "display-window" = "";
      "display-combi" = "";
      "display-calc" = " ";
      "display-emoji" = " ";
      "show-icons" = true;
    };
  };
}
