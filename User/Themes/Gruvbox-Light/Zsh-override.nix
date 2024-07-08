{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    programs.starship = lib.mkForce {
    enable = true;
    settings = {
      format = "
[┌](orange)[\\[](purple) $all[\\]](purple)
[└─>](bold orange)$character(bold purple)$battery";

      palette  = "custom";
      palettes.custom = {
        red =     colors.red;
        orange =  colors.orange;
        yellow =  colors.yellow;
        green =   colors.green;
        cyan =    colors.aqua;
        blue =    colors.blue;
        purple =  colors.purple;
        black =   colors.black;
        white =   colors.white;
      };

      character = {

      };
    };
    };
}