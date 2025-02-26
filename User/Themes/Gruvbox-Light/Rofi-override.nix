{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
  inherit (config.lib.formats.rasi) mkLiteral;
  rofi-theme = {
    "*" = {
      bg0 = mkLiteral colors.bg0_hard;
      bg1 = mkLiteral colors.bg0;
      bg2 = mkLiteral colors.bg0_soft;
      bg3 = mkLiteral colors.bg1;

      fg0 = mkLiteral colors.fg0;
      fg1 = mkLiteral colors.fg0_soft;
      fg2 = mkLiteral colors.fg1;

      hlg0 = mkLiteral colors.fg4;
      hlg1 = mkLiteral colors.bg3;
      hlg2 = mkLiteral colors.bg4;
      hlg3 = mkLiteral colors.bg2;

      red = mkLiteral colors.red;
      blue = mkLiteral colors.bright_blue;
      orange = mkLiteral colors.orange;
      yellow = mkLiteral colors.yellow;
      green = mkLiteral colors.green;
      aqua = mkLiteral colors.aqua;
      purple = mkLiteral colors.purple;
      white = mkLiteral colors.white;
      black = mkLiteral colors.black;

      reddark = mkLiteral colors.faded_red;
      yellowdark = mkLiteral colors.faded_yellow;

      foreground = mkLiteral "@hlg2";
      background-color = mkLiteral "transparent";
      highlight = mkLiteral "underline bold ${colors.fg1}";
      transparent = mkLiteral "rgba(46,52,64,0)";
    };

    "window" = {
      location = mkLiteral "center";
      anchor = mkLiteral "center";
      border-radius = mkLiteral "10px";
      height = mkLiteral "560px";
      width = mkLiteral "600px";

      background-color = mkLiteral "@transparent";
      spacing = 0;
      children = mkLiteral "[mainbox]";
      orientation = mkLiteral "horizontal";
    };

    "mainbox" = {
      spacing = 0;
      children = mkLiteral "[ inputbar, message, listview ]";
    };

    "message" = {
      padding = mkLiteral "10px";
      border = mkLiteral "0px 2px 2px 2px";
      border-color = mkLiteral "@bg0";
      background-color = mkLiteral "@hlg0";
    };

    "inputbar" = {
      color = mkLiteral "@fg2";
      padding = mkLiteral "14px";
      background-color = mkLiteral "@bg0";
      border-color = mkLiteral "@bg0";

      border = mkLiteral "1px";
      border-radius = mkLiteral "10px 10px 0px 0px";
    };

    "entry, prompt, case-indicator" = {
      text-font = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    "prompt" = {
      margin = mkLiteral "0px 1em 0em 0em";
    };

    "listview" = {
      padding = mkLiteral "8px";
      border-radius = mkLiteral "0px 0px 10px 10px";
      border = mkLiteral "2px 2px 2px 2px";
      border-color = mkLiteral "@bg0";
      background-color = mkLiteral "@bg0";
      dynamic = false;
    };

    "element" = {
      padding = mkLiteral "5px";
      vertical-align = mkLiteral "0.5";
      border-radius = mkLiteral "10px";
      color = mkLiteral "@blue";
      text-color = mkLiteral "@fg2";
      background-color = mkLiteral "@bg2"; #change this to change alternate elements bg
    };

    "element.normal.active" = {
      background-color = mkLiteral "@yellow";
    };

    "element.normal.urgent" = {
      background-color = mkLiteral "@reddark";
    };

    "element.selected.normal" = {
      background-color = mkLiteral "@blue";
      text-color = mkLiteral "@bg0";
    };

    "element.selected.active" = {
      background-color = mkLiteral "@yellowdark";
    };

    "element.selected.urgent" = {
      background-color = mkLiteral "@red";
    };

    "element.alternate.normal" = {
      background-color = mkLiteral "@transparent";
    };

    "element-text, element-icon" = {
      size = mkLiteral "3ch";
      margin = mkLiteral "0 10 0 0";
      vertical-align = mkLiteral "0.5";
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "@fg2";
    };

    "element-text.selected.active" = {
      text-color = mkLiteral "@bg0";

    };

    "button" = {
      padding = mkLiteral "6px";
      color = mkLiteral "@blue";
      horizontal-align = mkLiteral "0.5";

      border = mkLiteral "2px 0px 2px 2px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "@blue";
    };

    "button.selected.normal" = {
      border = mkLiteral "2px 0px 2px 2px";
      border-color = mkLiteral "@blue";
    };
  };
in
{
  programs.rofi = {
    font = lib.mkForce "FiraCode Nerd Font 12";
    theme = lib.mkForce rofi-theme;
  };
}
