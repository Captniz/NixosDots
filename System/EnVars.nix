{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  userSettings,
  ...
}:

{
  environment.sessionVariables = {
    # XDG Vars
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # Style vars
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "12";
    WLR_NO_HARDWARE_CURSORS = "1";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "12";

    # Common vars
    GDK_SCALE = "1";
    LIBSEAT_BACKEND = "logind";
    TERM = "xterm-256color";
    QT_QPA_PLATFORM = "wayland";
    QML_IMPORT_PATH = "/run/current-system/sw/lib/qt-6/qml";

    # Nix vars
    NIXOS_OZONE_WL = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    NIXPKGS_ALLOW_UNFREE = "1";

    # Application vars
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${userSettings.username}/.steam/root/compatibilitytools.d";
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    WINEPREFIX = "/home/${userSettings.username}/.local/share/wineprefixes/wineprefix32";

    # Default applications
    #DEFAULT_BROWSER = "${pkgs.zen-browser.packages."${systemSettings.system}".default}/bin/zen-beta";
    EDITOR = "${pkgs.neovim}/bin/nvim";
    BROWSER = "xdg-open";
  };
}
