{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Iosevka"
        "Meslo"
      ];
    }) # Nerd Fonts
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
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    theme = {
      name = "Gruvbox theme";
      package = pkgs.gruvbox-gtk-theme;
    };
  };
}
