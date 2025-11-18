{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  services.cliphist = {
    enable = true;
    allowImages = true;
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
