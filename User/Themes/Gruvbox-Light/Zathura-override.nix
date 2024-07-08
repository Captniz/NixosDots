{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    programs.zathura.options = {
      default-bg   =  lib.mkForce colors.bg0_hard; # bg
    };
}