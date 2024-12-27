{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  home.packages = [
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];
}
