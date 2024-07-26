{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
  inherit (config.lib.formats.rasi) mkLiteral; 
  rofi-theme = {
    "*" = {
      gruv0 = mkLiteral colors.black;
      gruv1 = mkLiteral colors.bg0_soft;
      gruv2 = mkLiteral colors.bg2;
      gruv3 = mkLiteral colors.bg3;

      gruv4= mkLiteral colors.fg0;
      gruv5= mkLiteral colors.fg0_soft;
      gruv6= mkLiteral colors.fg1;

      gruv7= mkLiteral colors.fg4;
      gruv8= mkLiteral colors.gray;
      gruv9= mkLiteral colors.bg4;
      gruv10= mkLiteral colors.bg2;

      red= mkLiteral colors.red;
      orange= mkLiteral colors.orange;
      yellow= mkLiteral colors.yellow;
      green= mkLiteral colors.green;
      aqua= mkLiteral colors.aqua;
      purple= mkLiteral colors.purple;

      reddark= mkLiteral "#c14a4a";
      yellowdark= mkLiteral "#b47109";

      foreground=  mkLiteral "@gruv9";
      background-color = mkLiteral "transparent";

      highlight= mkLiteral "underline bold ${colors.fg1}";

      transparent= mkLiteral "rgba(46,52,64,0)";
    };

    "window" = {
      location= mkLiteral "center";
      anchor= mkLiteral   "center";
      height= mkLiteral "560px";
      width= mkLiteral "600px";

      background-color= mkLiteral "@transparent";
      spacing= 0;
      children= mkLiteral "[mainbox]";
      orientation= mkLiteral "horizontal";
    };

    "mainbox" = {
      spacing= 0;
      children= mkLiteral "[ inputbar, message, listview ]";
    };

    "message" = {
      padding= mkLiteral "10px";
      border= mkLiteral "0px 2px 2px 2px";
      border-color= mkLiteral "@gruv0";
      background-color= mkLiteral "@gruv7";
    };

    "inputbar"= {
      color= mkLiteral "@gruv6";
      padding= mkLiteral "14px";
      background-color= mkLiteral "@gruv0";
      border-color= mkLiteral "@gruv0";

      border= mkLiteral "1px";
    };

    "entry, prompt, case-indicator"= {
      text-font= mkLiteral "inherit";
      text-color= mkLiteral "inherit";
    };

    "prompt"= {
      margin= mkLiteral "0px 1em 0em 0em";
    };

    "listview"= {
      padding= mkLiteral "8px";
      border= mkLiteral "2px 2px 2px 2px";
      border-color= mkLiteral "@gruv0";
      background-color= mkLiteral "@gruv0";
      dynamic= false;
    };

    "element" ={
      padding= mkLiteral "5px";
      vertical-align= mkLiteral "0.5";
      border-radius= mkLiteral "10px";
      color= mkLiteral "@foreground";
      text-color= mkLiteral "@gruv6";
      background-color= mkLiteral "@gruv1";
    };

    "element.normal.active"= {
      background-color= mkLiteral "@yellow";
    };

    "element.normal.urgent"= {
      background-color= mkLiteral "@reddark";
    };

    "element.selected.normal"= {
      background-color= mkLiteral "@gruv7";
      text-color= mkLiteral "@gruv0";
    };

    "element.selected.active"= {
      background-color= mkLiteral "@yellowdark";
    };

    "element.selected.urgent" ={
      background-color= mkLiteral "@red";
    };

    "element.alternate.normal" ={
      background-color= mkLiteral "@transparent";
    };

    "element-text, element-icon"= {
      size= mkLiteral "3ch";
      margin= mkLiteral "0 10 0 0";
      vertical-align= mkLiteral "0.5";
      background-color= mkLiteral "inherit";
      text-color= mkLiteral "@gruv6";
    };

    "button"= {
      padding= mkLiteral "6px";
      color= mkLiteral "@foreground";
      horizontal-align= mkLiteral "0.5";

      border= mkLiteral "2px 0px 2px 2px";
      border-radius= mkLiteral "10px";
      border-color= mkLiteral "@foreground";
    };

    "button.selected.normal" = {
      border= mkLiteral "2px 0px 2px 2px";
      border-color= mkLiteral "@foreground";
    };
  };
in
{
  programs.rofi = {
    font = lib.mkForce "FiraCode Nerd Font 12";
    theme = lib.mkForce rofi-theme;
  };
}