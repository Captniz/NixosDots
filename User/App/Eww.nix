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
  imports = [
    ../Themes/${userSettings.theme}/Eww-override.nix
  ];

  # ####################################### Services

  systemd.user.services."eww-daemon" = {
    Unit = {
      Description = "Eww daemon";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
      Requires = [ "hyprland-session.target" ];
      After = [ "hyprland-session.target" ];
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
      Requires = [ "hyprland-session.target" ];
    };
    Service = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "${pkgs.eww}/bin/eww open bar";
      ExecStop = "${pkgs.eww}/bin/eww close bar";
    };
  }; 

  # ####################################### Config Files

  # Scripts location
  home.file.".config/eww/Scripts" = {
    enable = true;
    source = "/etc/nixos/User/Scripts/Eww";
    recursive = true;
  };

  # Eww configuration files
  home.file.".config/eww/eww.yuck" = {
    enable = true;
    source = "/etc/nixos/User/Themes/${userSettings.theme}/eww/eww.yuck";
  };

  home.file.".config/eww/eww.scss" = {
    enable = true;
    source = "/etc/nixos/User/Themes/${userSettings.theme}/eww/eww.scss";
  };

  # Eww style files
  home.file.".config/eww/colors.scss" = {
    enable = true;
    text = "
      $fg0_hard: ${colors.fg0_hard};
      $fg0: ${colors.fg0};
      $fg0_soft: ${colors.fg0_soft};
      $fg1: ${colors.fg1};
      $fg2: ${colors.fg2};
      $fg3: ${colors.fg3};
      $fg4: ${colors.fg4};
      $fg4_256: ${colors.fg4_256};

      $gray: ${colors.gray};

      $bg0_hard: ${colors.bg0_hard};
      $bg0: ${colors.bg0};
      $bg0_soft: ${colors.bg0_soft};
      $bg1: ${colors.bg1};
      $bg2: ${colors.bg2};
      $bg3: ${colors.bg3};
      $bg4: ${colors.bg4};
      $bg4_256: ${colors.bg4_256};

      $bright_red: ${colors.bright_red};
      $bright_green: ${colors.bright_green};
      $bright_yellow: ${colors.bright_yellow};
      $bright_blue: ${colors.bright_blue};
      $bright_purple: ${colors.bright_purple};
      $bright_aqua: ${colors.bright_aqua};
      $bright_orange: ${colors.bright_orange};
      $bright_black: ${colors.bright_black};
      $bright_white: ${colors.bright_white};

      $red: ${colors.red};
      $green: ${colors.green};
      $yellow: ${colors.yellow};
      $blue: ${colors.blue};
      $purple: ${colors.purple};
      $aqua: ${colors.aqua};
      $orange: ${colors.orange};
      $black: ${colors.black};
      $white: ${colors.white};

      $faded_red: ${colors.faded_red};
      $faded_green: ${colors.faded_green};
      $faded_yellow: ${colors.faded_yellow};
      $faded_blue: ${colors.faded_blue};
      $faded_purple: ${colors.faded_purple};
      $faded_aqua: ${colors.faded_aqua};
      $faded_orange: ${colors.faded_orange};
      $faded_black: ${colors.faded_black};
      $faded_white: ${colors.faded_white};
    ";
  };

  programs.eww = {
    enable = true;
    configDir = "${config.home.homeDirectory}/.config/eww";
  };
}
