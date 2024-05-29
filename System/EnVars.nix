{ config, lib, pkgs, systemSettings, ...}:

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
    STEAM_EXTRA_COMPAT_TOOLS_PATHS="/home/user/.steam/root/compatibilitytools.d";

    # Default applications
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  };
}