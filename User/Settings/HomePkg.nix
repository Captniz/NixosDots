{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Flake-Installed packages
  home.packages = [
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
  ];
}
