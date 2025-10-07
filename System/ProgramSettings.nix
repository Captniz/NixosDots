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
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # Virtualisation
  virtualisation.docker.enable = true;

  # Program configuration
  programs = {
    wireshark.enable = true;

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
