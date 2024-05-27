{ config, lib, pkgs, ...}:

{
  fonts.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })  
  ];
}