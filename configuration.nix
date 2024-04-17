# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "it2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simo = {
    isNormalUser = true;
    description = "Simone";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     
    # System
    hyprland            # Window manager
    zsh                 # Shell
    dunst               # Notification manager

    # Essentials
    neovim              # Text editor
    alacritty           # Term. emulator
    ranger              # File manager
    firefox             # Browser
    git                 # Version manager
    swww                # Wallpaper manager        
    qimgv               # Image viewer

    # Utility & QoL
    bash-completion
    rofi-wayland        # App. launcher
    unzip               

    # Themes
    bibata-cursors
      
    # Programs & Apps
    vscode
    obsidian
  ];

 programs = {
   zsh = {
     enable = true;
   };
   
   hyprland = {
     enable = true;
     xwayland.enable = true;
   };
 };
 
  environment.sessionVariables = {
    
    # Common vars
    WLR_NO_HARDWARE_CURSORS = "1";
    XCURSOR_SIZE = "12";
    GDK_SCALE = "1";
    
    # Nix vars
    NIXOS_OZONE_WL = "1"; 
    NIXPKGS_ALLOW_INSECURE="1";
    
    # Default applications
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  };

  # Default applications
  xdg.mime = {
    enable =  true;
    defaultApplications = {
      "default-web-browser"           = [ "firefox.desktop" ];
      "text/html"                     = [ "firefox.desktop" ];
      "x-scheme-handler/http"         = [ "firefox.desktop" ];
      "x-scheme-handler/https"        = [ "firefox.desktop" ];
      "x-scheme-handler/about"        = [ "firefox.desktop" ];
      "x-scheme-handler/unknown"      = [ "firefox.desktop" ];
    };
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  #Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
}
