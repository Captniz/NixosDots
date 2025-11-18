{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services.polkit-agent = {
    Unit.Description = "Polkit GNOME authentication agent";
    Install.WantedBy = [ "graphical-session.target" ];
    Service.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
