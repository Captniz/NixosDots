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
  systemd.user.services."eww-daemon" = {
    Unit = {
      Description = "Eww daemon";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Restart = "on-failure";
      Type = "exec";
      ExecStart = "${pkgs.eww}/bin/eww daemon --no-daemonize";
    };
  };

  systemd.user.services."eww-bar" = {
    Unit = {
      Description = "ElKowars wacky widgets - personal bar";
      Documentation = "https://elkowar.github.io/eww/";
      Requires = [ "eww-daemon.service" ];
      After = [ "eww-daemon.service" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "${pkgs.eww}/bin/eww open bar";
      ExecStop = "${pkgs.eww}/bin/eww close bar";
    };
  };

  imports = [
    ../Themes/${userSettings.theme}/Eww-override.nix
  ];

  home.file.".config/eww/Scripts" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/eww/Scripts";
    recursive = true;
  };

  home.file.".config/eww/eww.yuck" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/eww/eww.yuck";
  };

  home.file.".config/eww/colors.scss" = {
    enable = true;
    text = "
      $bg: ${colors.bg0};
      $hbg: ${colors.bg2};
      $fg: ${colors.fg0};
      $purple: ${colors.purple};
      $red: ${colors.red};
      $orange: ${colors.orange};
      $yellow: ${colors.yellow};
      $green: ${colors.green};
      $blue: ${colors.blue};
      $aqua: ${colors.aqua};
      $border: ${colors.bg1};

      $font: \"Iosevka NFM\";
    ";
  };
  home.file.".config/eww/eww.scss" = {
    enable = true;
    text = "
      @import \"colors\";

      * {
          all: unset; 
        }

      .barra{
        color: $fg;
        background-color: transparent;
        font-family: $font;
        border-radius: 10px;
      }

      .menu{
        color: $fg;
        background-color: $bg;
        font-family: $font;
        border-radius: 10px;
        border: 2px solid $border; 
      }

      .module{
        background-color: $bg;
        color: $border;
        font-family: $font;
        font-weight: bold;
        border-radius: 8px;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-right: 10px;
        padding-left: 10px;
        border: 2px solid $border; 
      }

      .moduleC{
        @extend .module;
      }

      .moduleR{
        @extend .module;
        padding-right: 10px;
      }

      .moduleL{
        @extend .module;
        padding-left: 16px;
        padding-right: 20px;
      }

      .workspace{
        padding: 0px;
        margin: 0px;
        font-size: 20px;
      }

      .circle{
        color: $fg;
        padding: 9px;
        font-size: 12px;
      }

      .circ-values{
        background-color: $hbg;
        color: $green;
        font-family: $font;
        font-weight: bold;
        border-radius: 10px;
      }

      .circ-values-disabled{
        @extend .circ-values;
        color: $border;
      }

      .circ-values-1{
        @extend .circ-values;
        color: $blue;
      }

      .circ-values-2{
        @extend .circ-values;
        color: $yellow;
      }

      .circ-values-3{
        @extend .circ-values;
        color: $green;
      }

      .active-workspace{
        @extend .workspace;
        color: $aqua;
      }

      .used-workspace{
        @extend .workspace;
        color: $red;
      }

      .empty-workspace{
        @extend .workspace;
        color: $hbg;
      }

      .time-widget{
        color: $orange;
      }

      .date-widget{
        color: $red;
      }

      .no-wifi{
        font-size: 23px;
        color: $red;
      }

      .no-wifi-text{
        color: $red;
      }

      .yes-wifi{
        font-size: 23px;
        color: $aqua;
      }

      .yes-wifi-text{
        color: $purple;
      }

      .yes-bt{
        font-size: 21px;
        color: $aqua;
      }

      .yes-bt-text{
        color: $purple;
      }

      .no-bt{
        font-size: 24px;
        color: $red;
      }

      .no-bt-text{
        color: $red;
      }

      .power-icons{
        font-size: 23px;
        color: $orange;
      }

      .active-window{
        color: $yellow;
      }

      .calendar{
        border: 2px solid $green;
        padding: 10px;
        border-radius: 10px;
      }
    ";
  };
  programs.eww = {
    enable = true;
    configDir = "${config.home.homeDirectory}/.config/eww";
  };
}
