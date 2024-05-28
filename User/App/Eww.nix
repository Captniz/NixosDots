{ config, lib, pkgs, ...}:

{
  programs.eww = {
    enable = true;
    configDir = "/etc/nixos/User/ExtraConfigs/eww";
  };
}