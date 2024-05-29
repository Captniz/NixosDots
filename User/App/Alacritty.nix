{ config, lib, pkgs, userSettings, ...}:

{
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
          background =   "#282828";
          foreground =   "#ebdbb2";
        };
        cursor = {
          cursor =   "#ebdbb2";
          text =   "#ebdbb2";
        };
        normal = {
          red =     "#cc241d";
          yellow =  "#d79921";
          green =   "#98971a";
          cyan =    "#689d6a";
          blue =    "#458588";
          magenta = "#b16286";
          black =   "#282828";
          white =   "#ebdbb2";
        };
        bright = {
          red =     "#fb4934";
          yellow =  "#fabd2f";
          green =   "#b8bb26";
          cyan =    "#8ec07c";
          blue =    "#83a598";
          magenta = "#d3869b";
          black =   "#504945";
          white =   "#fbf1c7";
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