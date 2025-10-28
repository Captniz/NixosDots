{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services.swww-daemon = {
    description = "Start swww daemon";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.swww}/bin/swww-daemon";
  };

  systemd.user.services.swww-wallpaper = {
    description = "Set wallpaper with swww";
    after = [ "swww-daemon.service" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.swww}/bin/swww img /home/simo/Images/Wallpapers/74.png";
  };
}
