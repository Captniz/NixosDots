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
    ../Themes/${userSettings.theme}/Quickshell-override.nix
  ];

  # ####################################### Services

  systemd.user.services."quickshell" = {
    Unit = {
      Description = "Quickshell configuration";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
      Requires = [ "hyprland-session.target" ];
      After = [ "hyprland-session.target" ];
    };
    Service = {
      Restart = "on-failure";
      Type = "exec";
      ExecStart = "${pkgs.quickshell}/bin/quickshell -n";
    };
  };

  # ####################################### Config Files

  # Scripts location
  home.file.".config/quickshell" = {
    enable = true;
    source = "/etc/nixos/User/Themes/${userSettings.theme}/Quickshell";
    recursive = true;
  };

}
