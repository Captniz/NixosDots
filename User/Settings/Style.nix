{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  imports = [
    ../Themes/${userSettings.theme}/Style-override.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [

    # Fonts
    #! If shit is broken do "fc-cache -r"
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
    victor-mono
    ibm-plex

    # Themes
    bibata-cursors # Cursor theme
    papirus-icon-theme # Icon theme
    nixos-icons
    gruvterial-theme # GTK theme
  ];

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };

  gtk = {
    gtk4.theme = null;
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      name = "Papirus"; # exact folder name
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "gruvterial"; # exact folder name, not "Gruvbox theme"
      package = pkgs.gruvterial-theme;
    };
  };
}
