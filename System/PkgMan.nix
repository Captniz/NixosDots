{ config, lib, pkgs, systemSettings, ...}:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "the_electron_version"];
  };

  environment.systemPackages = with pkgs; [   
    # Essentials

    hyprland            # Window manager
    zsh                 # Shell
    dunst               # Notification manager
    sddm                # Display manager
    pipewire            # Audio server
    wireplumber         # Audio server
    pavucontrol         # Audio control
    light               # Brightness control
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
    p7zip               # Archive manager
    unzip               # Archive manager      
    
    # Languages
    
    jdk                # Java
    (pkgs.python3.withPackages (python-pkgs: [  # Python
      python-pkgs.pandas
      python-pkgs.requests
      python-pkgs.setuptools
    ]))

    # Dependencies/Libraries/Single Use Programs

    wev
    libsForQt5.qt5.qtquickcontrols # Qt5 libraries
    libsForQt5.qt5.qtgraphicaleffects # Qt5 libraries
    grim                # Screenshot tool
    slurp               # Screen Region selector
    jc                  # JSON parser
    jq                  # JSON parser     
    file                # File type checker
    ueberzugpp          # Terminal Image viewer
    git-credential-oauth# Git credential helper
    polkit              # Authorization manager
    polkit_gnome        # Authorization manager
    xwaylandvideobridge # Xwayland bridge
    xdg-utils           # Desktop utilities
    xdg-desktop-portal-gtk # Desktop utilities
    xdg-desktop-portal-hyprland # Desktop utilities
    (pkgs.wordlists.override { lists = with pkgs; [   # Wordlists
      rockyou 
    ];}) 
    xorg.xhost          # Xorg utility
    hyprland-protocols  # Hyprland protocols
    wlroots             # Wayland compositor
    poppler             # PDF library
    poppler_utils       # PDF library
    winetricks          # Wine utility
    wineWowPackages.waylandFull # Wine utility


    # Utility / Quality of Life / Useful Commands
    
    fzf                 # Fuzzy File Finder
    protonup            # Proton updater
    bash-completion     # Terminal completion
    bat                 # Cat clone
    tesseract           # Image OCR
    john                # Password cracker
    ocrmypdf            # PDF OCR
    qdirstat            # Disk usage analyzer
    gparted             # Partition manager

    # Programs & Apps
  
    docker              # Container manager
    balena-cli          # Balena CLI
    #vesktop             # Chat client
    webcord             # Discord client
    lutris              # Game client
    steam               # Game client  
    dia                 # Diagram editor
    vlc                 # Media player
    obs-studio          # Media creator / Streaming software
    rofi-wayland        # App launcher
    eww                 # Widget manager
    zathura             # PDF viewer
    android-studio      # Android IDE
    vscode              # Code editor
    obsidian            # Note taking app
    cider               # Apple Music client
    unityhub            # Unity IDE
  ];
}