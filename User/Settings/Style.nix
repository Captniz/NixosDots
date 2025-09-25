{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [

    # Fonts
    #! If shit is brokey do "fc-cache -r"
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg

    # Themes
    bibata-cursors # Cursor theme
    papirus-icon-theme # Icon theme
    gruvbox-material-gtk-theme
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };

  gtk = {
    enable = true;
    gtk2.enable = true;
    gtk3.enable = true;
    gtk4.enable = true;
    colorScheme = "dark";

    iconTheme = {
      name = "Papirus"; # exact folder name
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Gruvbox-Material-Dark-HIDPI"; # exact folder name, not "Gruvbox theme"
      package = pkgs.gruvbox-material-gtk-theme;
    };
  };
}
