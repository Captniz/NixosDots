{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
{
  imports = [
    ../Themes/${userSettings.theme}/Zathura-override.nix
  ];
  programs.zathura = {
    enable = true;
    options = {
      database = "sqlite";

      selection-clipboard ="clipboard";
      adjust-open = "best-fit";
      pages-per-row = 1;
      scroll-page-aware = true;
      #smooth-scroll = true;
      scroll-full-overlap = "0.01";
      scroll-step = 100;
      zoom-min = 10;
      guioptions = "s";

      notification-error-bg   =    colors.bg0; # bg
      notification-error-fg   =    colors.bright_red; # bright:red
      notification-warning-bg =    colors.bg0; # bg
      notification-warning-fg =    colors.bright_yellow; # bright:yellow
      notification-bg         =    colors.bg0; # bg
      notification-fg         =    colors.bright_green; # bright:green

      completion-bg           =    colors.bg2; # bg2
      completion-fg           =    colors.fg1; # fg
      completion-group-bg     =    colors.bg1; # bg1
      completion-group-fg     =    colors.gray; # gray
      completion-highlight-bg =    colors.bright_blue; # bright:blue
      completion-highlight-fg =    colors.bg2; # bg2

      # Define the color in index mode
      index-bg                =    colors.bg2; # bg2
      index-fg                =    colors.fg1; # fg
      index-active-bg         =    colors.bright_blue; # bright:blue
      index-active-fg         =    colors.bg2; # bg2

      inputbar-bg             =    colors.bg0; # bg
      inputbar-fg             =    colors.fg1; # fg

      statusbar-bg            =    colors.bg2; # bg2
      statusbar-fg            =    colors.fg1; # fg

      highlight-color         =    colors.bright_yellow; # bright:yellow
      highlight-active-color  =    colors.bright_orange; # bright:orange

      default-bg               =   colors.bg0; # bg
      default-fg               =   colors.fg1; # fg
      render-loading           =   true;
      render-loading-bg        =   colors.bg0; # bg
      render-loading-fg        =   colors.fg1; # fg

      # Recolor book content's color
      recolor-lightcolor       =   colors.bg0; # bg
      recolor-darkcolor        =   colors.fg1; # fg
      recolor                  =   true;
      #recolor-keephue          =   true      

      recolor-reverse-video = true;
    };
  };
}