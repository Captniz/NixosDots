{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
  home.file."../../etc/nixos/User/ExtraConfigs/eww/colors.scss" = lib.mkForce {
    enable = true;
    text = "
      $bg: ${colors.bg0_hard};
      $hbg: ${colors.bg2};
      $fg: ${colors.fg0};
      $purple: ${colors.purple};
      $red: ${colors.red};
      $orange: ${colors.orange};
      $yellow: ${colors.yellow};
      $green: ${colors.green};
      $blue: ${colors.red};
      $aqua: ${colors.aqua};
      $border: ${colors.bg1};

      $font: \"Iosevka NFM\";
    ";
  };
}