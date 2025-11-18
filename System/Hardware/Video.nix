{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  # Basic graphics settings
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware = {
    nvidia.modesetting.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

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

  # Windows manager settings
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable backlight control
  programs.light.enable = true;
}
