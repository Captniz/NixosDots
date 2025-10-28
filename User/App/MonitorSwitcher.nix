{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services."monitor-switcher" = {
    Description = "Monitor switching script";
    Install = {
      wantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/User/Scripts/MonitorSwitcher.sh";
    };
  };
}
