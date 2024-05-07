{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
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
    xkb.layout = "it";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "it2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simo = {
    isNormalUser = true;
    description = "Simone";
    extraGroups = [ "networkmanager" "wheel" "kvm" "audio" "sound" "video"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  sound.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  #  pulseaudio = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     
    # System
    hyprland            # Window manager
    zsh                 # Shell
    dunst               # Notification manager
    sddm                # Display manager
    pipewire            # Audio server
    pavucontrol         # Audio control
    light               # Brightness control

    # Essentials
    neovim              # Text editor
    alacritty           # Term. emulator
    ranger              # File manager
    firefox             # Browser
    git                 # Version manager
    swww                # Wallpaper manager        
    qimgv               # Image viewer
    libreoffice-qt-fresh# Office suite
    nitch               # System fetch
    btop                # System monitor     
    grim                # Screenshot tool
    slurp               # Region selector
    
    # Languages

    # Utility & QoL
    git-credential-oauth
    xdg-utils
    xorg.xhost
    bash-completion
    ueberzugpp
    poppler
    poppler_utils
    unzip          
    winetricks
    jc
    jq
    bat
    polkit
    polkit_gnome
    wineWowPackages.waylandFull

    # Themes
    bibata-cursors
    starship
      
    # Programs & Apps
    qdirstat
    gparted
    discord
    lutris
    steam
    dia
    vlc
    obs-studio
    rofi-wayland      
    eww  
    zathura
    android-studio      
    vscode    
    obsidian 

    #Test
  ];

  fonts.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })  
  ];

 programs = {
  steam = {
   enable = true;
   remotePlay.openFirewall = true; 
   dedicatedServer.openFirewall = true;
  };

  light.enable = true;
  
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
    TERM = "xterm-256color";
    
    # Nix vars
    NIXOS_OZONE_WL = "1"; 
    NIXPKGS_ALLOW_INSECURE="1";
    NIXPKGS_ALLOW_UNFREE="1";
    
    # Application vars

    # Default applications
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  };

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

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    # pulseaudio.enable = true;
    # pulseaudio.support32Bit = true;
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

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    postgresql = {
      enable = true;
      ensureDatabases = [ "mydatabase" ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  
  fileSystems."mnt/Storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ext4";
    #options = [ "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
  };

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
