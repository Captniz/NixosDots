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
    ../Themes/${userSettings.theme}/Quickshell-override.nix
  ];

  # ####################################### Services

  programs.quickshell = {
    enable = true;
    configs = {
      default = "/etc/nixos/User/Themes/${userSettings.theme}/Quickshell";
    };
    activeConfig = "default";
    systemd.enable = true;
  };
}
