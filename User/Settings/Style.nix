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
    gruvbox-gtk-theme # Gtk theme
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Gruvbox theme";
      package = pkgs.gruvbox-gtk-theme;
    };
  };
}
