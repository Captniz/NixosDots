{ config, lib, pkgs, userSettings, ...}:

let
  colors = ../Themes/${userSettings.theme}/Colors.nix;
in
{
  imports = [
    ../Themes/${userSettings.theme}
  ];
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 4;
          y = 0;
        };
      };
      colors = {
        primary = {
          background =   colors.bg0;
          foreground =   colors.fg1;
        };
        cursor = {
          cursor = colors.fg1;
          text =   colors.fg1;
        };
        normal = {
          red =     colors.red;
          yellow =  colors.yellow;
          green =   colors.green;
          cyan =    colors.cyan;
          blue =    colors.blue;
          magenta = colors.magenta;
          black =   colors.fg0;
          white =   colors.bg1;
        };
        bright = {
          red =     colors.bright_red;
          yellow =  colors.bright_yellow;
          green =   colors.bright_green;
          cyan =    colors.bright_cyan;
          blue =    colors.bright_blue;
          magenta = colors.bright_magenta;
          black =   colors.fg2;
          white =   colors.bg0;
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
        #draw_bold_text_with_bright_colors = false;
      };
      env.TERM = "xterm-256color";
    };
  };
}