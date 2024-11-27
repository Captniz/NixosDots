{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
in
{
  programs.alacritty.settings.colors.primary = lib.mkForce {
    background = colors.bg0_hard;
    foreground = colors.fg1;
  };
}
