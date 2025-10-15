{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
        unlock_cmd = "dunstify -t 600 'Bentornato'";
      };

      listener = [
        {
          timeout = 90;
          on-timeout = "hyprlock";
        }
        {
          timeout = 120;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 300;
          on-timeout = "systemctl hybrid-sleep";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
