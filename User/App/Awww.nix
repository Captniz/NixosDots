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
  services.awww = {
    enable = true;
    extraArgs = [
      "--no-cache"
    ];
  };

  systemd.user.services."set-wallpaper" = {
    Unit = {
      Description = "Set wallpaper via awww";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.awww}/bin/awww img ${wallpaper} --transition-type none
      '';

      After = [ "awww.service" ];
      Restart = "on-failure";
    };
  };
}
