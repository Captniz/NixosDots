{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services."monitor-switcher" = {
    Unit.Description = "Monitor switching script";
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Environment = "PATH=/run/current-system/sw/bin:/run/current-system/sw/sbin:/usr/bin:/bin";
      ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/User/Scripts/MonitorSwitcher.sh";
    };
  };
}
