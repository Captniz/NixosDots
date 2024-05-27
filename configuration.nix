{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./System/PkgMan.nix
    ./System/Locale.nix
    ./System/Networking.nix
    ./System/Style.nix
    ./System/Services.nix
    ./System/EnVars.nix
    ./System/Hardware.nix
    ./System/ProgramSettings.nix
  ];

  # Bootloader.
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simo = {
    isNormalUser = true;
    description = "Simone";
    extraGroups = [ "networkmanager" "wheel" "kvm" "audio" "sound" "video"];
    packages = with pkgs; [];
    # openssh.authorizedKeys.keys = ["AAAAC3NzaC1lZDI1NTE5AAAAIK1eVJW+B10QJrXyHsPmUHfFakEJK2XNu1gPuwA0qlH8"];
    shell = pkgs.zsh;
  };

  sound.enable = true;

  # Default applications
  xdg.mime = {
    enable =  true;
    defaultApplications = {
      "default-web-browser"           = [ "firefox.desktop" ];
      "text/html"                     = [ "firefox.desktop" ];  # Browser
      "x-scheme-handler/http"         = [ "firefox.desktop" ];
      "x-scheme-handler/https"        = [ "firefox.desktop" ];
      "x-scheme-handler/about"        = [ "firefox.desktop" ];
      "x-scheme-handler/unknown"      = [ "firefox.desktop" ];
      "image/jpeg"                    = [ "qimgv.desktop" ];    # Images
      "image/jpg"                     = [ "qimgv.desktop" ];    # Images
      "image/png"                     = [ "qimgv.desktop" ];    # Images
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  #Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.warn-dirty = false;
}
