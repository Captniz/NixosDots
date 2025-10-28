{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services.copyq = {
    description = "CopyQ clipboard manager";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.copyq}/bin/copyq --start-server";
  };

  systemd.user.services.wl-clip-persist = {
    description = "Persistent Wayland clipboard";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
  };

}
