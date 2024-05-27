{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./System/PkgMan.nix
    ./System/Locale.nix
    ./System/Networking.nix
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
    #openssh.authorizedKeys.keys = ["AAAAC3NzaC1lZDI1NTE5AAAAIK1eVJW+B10QJrXyHsPmUHfFakEJK2XNu1gPuwA0qlH8"];
    shell = pkgs.zsh;
  };

  sound.enable = true;

  fonts.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })  
  ];

 programs = {
  #gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};
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
    _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS="/home/user/.steam/root/compatibilitytools.d";

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
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
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
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };
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
  
  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ext4";
    #options = [ "uid=1000" "gid=1000" "dmask=007" "fmask=117" ];
  };

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = true;

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
