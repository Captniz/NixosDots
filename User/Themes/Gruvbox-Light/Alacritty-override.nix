{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    programs.alacritty.settings.window.colors.primary = {
        background =   colors.bg0_hard;
        foreground =   colors.fg1;
    };
}