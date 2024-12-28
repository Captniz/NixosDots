{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  home.packages = [
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];
}
