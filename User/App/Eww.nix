{ config, lib, pkgs, ...}:

{
  programs.eww = {
    enable = true;
    configDir = "/etc/nixos/extConfigs/eww";
  };
}