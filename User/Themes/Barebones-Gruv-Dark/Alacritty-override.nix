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
  programs.alacritty.settings.colors = lib.mkForce {
    primary = {
      background = colors.bg0_hard;
      foreground = colors.fg1;
    };
    cursor = {
      cursor = colors.fg1;
      text = colors.fg1;
    };
    normal = {
      red = colors.red;
      yellow = colors.yellow;
      green = colors.green;
      cyan = colors.aqua;
      blue = colors.blue;
      magenta = colors.purple;
      black = colors.black;
      white = colors.white;
    };
    bright = {
      red = colors.bright_red;
      yellow = colors.bright_yellow;
      green = colors.bright_green;
      cyan = colors.bright_aqua;
      blue = colors.bright_blue;
      magenta = colors.bright_purple;
      black = colors.bright_black;
      white = colors.bright_white;
    };
  };

}
