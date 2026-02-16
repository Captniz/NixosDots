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
    wlr.enable = false;

    config = {
      common.default = "hyprland";
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Windows manager settings
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  # Enable backlight control
  programs.light.enable = true;
}
