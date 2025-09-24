{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
    swayidle = {
      enable = true;
      extraArgs = ["-w"];
      events = [
        { event = "lock"; command = "hyprlock"; }
        { event = "before-sleep"; command = "hyprlock"; }
      ];
      timeout = [
        { timeout = 120; command = "hyprlock"; }
      ];
    };
}