{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services.swww-daemon = {
    Unit = {
      Description = "Start swww daemon";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "on-failure";
    };
  };
}
