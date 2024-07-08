{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    programs.zathura.options = lib.mkForce {
      default-bg   =   colors.bg0_hard; # bg
    };
}