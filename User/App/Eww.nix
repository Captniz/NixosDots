{ config, lib, pkgs, userSettings, ...}:

{
  programs.eww = {
    enable = true;
    configDir = "/etc/nixos/User/ExtraConfigs/eww";
  };
}