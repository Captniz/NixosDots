{ config, lib, pkgs, systemSettings, userSettings, ...}:

{
  environment.sessionVariables = {
    # Common vars
    WLR_NO_HARDWARE_CURSORS = "1";
    XCURSOR_SIZE = "12";
    GDK_SCALE = "1";
    TERM = "xterm-256color";
    
    # Nix vars
    NIXOS_OZONE_WL = "1"; 
    NIXPKGS_ALLOW_INSECURE="1";
    NIXPKGS_ALLOW_UNFREE="1";
    
    # Application vars
    _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS="/home/${userSettings.username}/.steam/root/compatibilitytools.d";
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    WINEPREFIX="/home/${userSettings.username}/.wine";

    # Default applications
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  };
}