{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs;  [
    starship
  ];

  programs.starship = {
    enable = true;
    settings = {
      format = "
[┌](orange)[\\[](green) $all[\\]](green)
[└─>](bold orange)$character$battery";

      palette  = "custom";
      palettes.custom = {
        red =     "#cc241d";
        orange =  "#d65d0e";
        yellow =  "#d79921";
        green =   "#98971a";
        cyan =    "#689d6a";
        blue =    "#458588";
        purple =  "#b16286";
        black =   "#282828";
        white =   "#ebdbb2";
      };

      battery = {
        disabled = false;
      };
      line_break = {
        disabled = true;
      };
      add_newline = false;
    };
  };
}