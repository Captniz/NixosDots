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

      hlg0 = mkLiteral colors.fg0;
      hlg1 = mkLiteral colors.gray;
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

      accent-color = mkLiteral colors.bright_blue;
      urgent-color = mkLiteral colors.red;

      text-color = mkLiteral "@fg0";

      background-color = mkLiteral "transparent";
      highlight = mkLiteral "underline bold ${colors.fg1}";
      transparent = mkLiteral "rgba(46,52,64,0)";

      margin = 0;
      padding = 0;
      spacing = 0;
    };

    "window" = {
      location = mkLiteral "south";
      width = mkLiteral "1920";
      background-color = mkLiteral "@bg0";
    };

    "inputbar" = {
      spacing = mkLiteral "8px";
      padding = mkLiteral "8px";

      background-color = mkLiteral "@bg1";
    };

    "prompt, entry, element-icon, element-text" = {
      vertical-align = mkLiteral "0.5";
    };

    "prompt" = {
      text-color = mkLiteral "@accent-color";
    };

    "textbox" = {
      padding = mkLiteral "8px";
      background-color = mkLiteral "@bg1";
    };

    "listview" = {
      padding = mkLiteral "4px 0";
      lines = mkLiteral "8";
      columns = 1;

      fixed-height = false;
    };

    "element" = {
      padding = mkLiteral "8px";
      spacing = mkLiteral "8px";
    };

    "element normal normal" = {
      text-color = mkLiteral "@fg0";
    };

    "element normal urgent" = {
      text-color = mkLiteral "@urgent-color";
    };

    "element normal active" = {
      text-color = mkLiteral "@accent-color";
    };

    "element alternate active" = {
      text-color = mkLiteral "@accent-color";
    };

    "element selected" = {
      text-color = mkLiteral "@bg0";
    };

    "element selected normal, element selected active" = {
      background-color = mkLiteral "@accent-color";
    };

    "element selected urgent" = {
      background-color = mkLiteral "@urgent-color";
    };

    "element-icon" = {
      size = mkLiteral "0.8em";
    };

    "element-text" = {
      text-color = mkLiteral "inherit";
    };
  };
in
{
  programs.rofi = {
    theme = lib.mkForce rofi-theme;
    font = lib.mkForce "FiraCode Nerd Font 12";
  };
}
