{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  # Xdg portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # Default applications
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ]; # Browser
      "text/xml" = [ "firefox.desktop" ]; # Browser
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];

      # MIME types
      "image/jpeg" = [ "qimgv.desktop" ]; # Images
      "image/jpg" = [ "qimgv.desktop" ]; # Images
      "image/png" = [ "qimgv.desktop" ]; # Images
      "application/pdf" = [ "zathura.desktop" ]; # PDF
      "application/epub+zip" = [ "zathura.desktop" ]; # Epub
    };
  };

  # Virtualisation
  virtualisation.docker.enable = true;

  # Program configuration
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    gamemode.enable = true;

    light.enable = true;

    zsh = {
      enable = true;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
