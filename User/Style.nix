{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs;  [
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
    bibata-cursors
    starship
  ];
}