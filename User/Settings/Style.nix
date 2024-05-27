{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs;  [
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
    bibata-cursors
    starship
  ];
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };
}