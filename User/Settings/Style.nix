{ config, lib, pkgs, userSettings, ...}:

{
  home.packages = with pkgs;  [
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "Meslo" ]; })  # Nerd Fonts
    bibata-cursors                                              # Cursor theme         
  ];
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };
}