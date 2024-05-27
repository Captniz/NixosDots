{ config, lib, pkgs, ...}:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "the_electron_version"];
  };

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
    jdk
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.requests
    ]))

    # Utility & QoL
    (pkgs.wordlists.override { lists = with pkgs; [ rockyou ]; })
    git-credential-oauth
    xdg-utils
    xdg-desktop-portal-hyprland
    xorg.xhost
    hyprland-protocols
    bash-completion
    ueberzugpp
    poppler
    poppler_utils
    unzip          
    winetricks
    jc
    protonup
    jq
    bat
    polkit
    polkit_gnome
    wineWowPackages.waylandFull

    # Themes
    bibata-cursors
    starship
      
    # Programs & Apps
    balena-cli
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
    john

    #Test
  ];
}