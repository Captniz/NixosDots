{ config, lib, pkgs, userSettings, ...}:

{
  home.file.".config/ranger/" = {
    enable = true;
    recursive = true;
    source = "/etc/nixos/User/ExtraConfigs/ranger/";
  };
}