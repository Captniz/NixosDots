{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  systemd.user.services."copyq" = {
    Unit = {
      description = "CopyQ clipboard manager";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.copyq}/bin/copyq --start-server";
    };
  };

  systemd.user.services."wl-clip-persist" = {
    Unit = {
      Description = "Persistent Wayland clipboard";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
    };
  };
}
