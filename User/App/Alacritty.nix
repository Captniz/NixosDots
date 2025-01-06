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
    ../Themes/${userSettings.theme}/Alacritty-override.nix
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        working_directory = "/home/${userSettings.username}";
      };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };
      colors = {
        primary = {
          background = colors.bg0;
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
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Retina";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        size = 12;
        builtin_box_drawing = false;
      };
      env.TERM = "xterm-256color";
    };
  };
}
