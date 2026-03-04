{
  config,
  lib,
  inputs,
  pkgs,
  userSettings,
  systemSettings,
  ...
}:

let
  wallpaper = "${inputs.gruvbox_wallpapers.packages."x86_64-linux".anime}/light/my-neighbor-totoro-sunflowers.png";
in 
{
  services.swww = {
    enable = true;
    extraArgs = [
      "--no-cache"
    ];
  };

  systemd.user.services."set-wallpaper" = {
    Unit = {
      Description = "Set wallpaper via swww";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.swww}/bin/swww img ${wallpaper} --transition-type none
      '';

      After = [ "swww.service" ];
      Restart = "on-failure";
    };
  };
}
