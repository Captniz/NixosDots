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

  # Other Rofi related packages/plugins
  home.packages = with pkgs; [
    rofi-obsidian
    rofi-bluetooth
    rofi-pulse-select
    rofi-network-manager
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-nerdy
    ];
    modes = [
      "window"
      "drun"
      "run"
      "ssh"
      "calc"
      "emoji"
      "keys"
      "nerdy"
      "obsidian:rofi-obsidian"
    ];
    extraConfig = {
      "display-ssh" = " ";
      "display-run" = " ";
      "display-drun" = " ";
      "display-window" = " ";
      "display-combi" = " ";
      "display-calc" = " ";
      "display-emoji" = " ";
      "show-icons" = true;
    };
  };
}
