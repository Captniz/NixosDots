{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
in
{
  home.file.".config/eww/colors.scss" = lib.mkForce {
    enable = true;
    text = "
      $bg: ${colors.bg0_hard};
      $bg2: ${colors.bg0};
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

  home.file.".config/eww/eww.scss" = lib.mkForce {
    enable = true;
    text = "
      @import \"colors\";

      * {
          all: unset; 
        }

      .barra{
        color: $fg;
        background-color: $bg2;
        font-family: $font;
      }

      .menu{
        color: $fg;
        background-color: $bg;
        font-family: $font;
      }

      .module{
        background-color: $bg;
        color: $border;
        font-family: $font;
        font-weight: bold;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-right: 10px;
        padding-left: 10px;
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
}
