{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services.polkit-agent = {
    description = "Polkit GNOME authentication agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
