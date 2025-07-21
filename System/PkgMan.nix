{
  config,
  lib,
  pkgs,
  systemSettings,
  inputs,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "the_electron_version" ];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    ########### Possible Fixes / Old Packages


    ########### Testing
    libsForQt5.xwaylandvideobridge   # Enabled after being disabled for a while, check if it works
    
    ###QuickShell testing
    inputs.quickshell.packages.${systemSettings.system}.default # Quick shell for Hyprland
    libsForQt5.qt5.qtdeclarative

    ########### Essentials

    zip # Archive manager
    udisks # Disk manager
    wl-clip-persist # Clipboard manager
    wl-clipboard # Clipboard manager
    copyq # Clipboard manager
    hyprlock # Screen locker
    hyprland # Window manager
    zsh # Shell
    dunst # Notification manager
    libsForQt5.sddm # Display manager
    pipewire # Audio server
    wireplumber # Audio server
    pavucontrol # Audio control
    light # Brightness control
    neovim # Text editor
    alacritty # Term. emulator
    git # Version manager
    swww # Wallpaper manager
    qimgv # Image viewer
    nitch # System fetch
    btop # System monitor
    p7zip # Archive manager
    unrar # Archive manager
    unzip # Archive manager

    ########### Languages

    R # R language
    nodejs_22 # Node.js
    rustfmt # Rust
    rustc # Rust
    cargo # Rust
    gcc # C
    libgcc # C
    clang-tools # C++
    cmake # C++
    conan # C++ package manager
    lcov # C++ code coverage
    vcpkg # C++ package manager
    vcpkg-tool # C++ package manager
    php # PHP
    (pkgs.jdk.override { enableJavaFX = true; }) # Java
    (pkgs.python3.withPackages (python-pkgs: [
      # Python
      python-pkgs.pandas
      python-pkgs.requests
      python-pkgs.setuptools
      python-pkgs.toml
    ]))
    typescript # TypeScript
    typescript-language-server # TypeScript
    polyml # ML

    ########### Dependencies/Libraries/Single Use Programs

    libinput # Input library
    owl # Owl library
    alsa-utils # Audio utilities
    webkitgtk_6_0 # Webkit
    dxvk # DirectX to Vulkan translation layer
    doxygen # Documentation generator
    mupdf # PDF viewer
    alsa-ucm-conf # ALSA UCM configuration
    sof-firmware # Sound Open Firmware
    wev # Input event viewer
    libsForQt5.qt5.qtquickcontrols # Qt5 libraries
    libsForQt5.qt5.qtgraphicaleffects # Qt5 libraries
    libsForQt5.qt5.qtwayland # Qt5 libraries
    grim # Screenshot tool
    ripgrep # Ripgrep
    fd # Fd
    glow # Markdown previewer
    slurp # Screen Region selector
    file # File type checker
    ueberzugpp # Terminal Image viewer
    git-credential-oauth # Git credential helper
    polkit # Authorization manager
    polkit_gnome # Authorization manager
    kdePackages.xwaylandvideobridge # Xwayland bridge
    xdg-utils # Desktop utilities
    xdg-desktop-portal-gtk # Desktop utilities
    xdg-desktop-portal-hyprland # Desktop utilities
    xdg-desktop-portal-wlr  # Desktop utilities
    xdg-desktop-portal   # Desktop utilities
    xorg.xhost # Xorg utility
    hyprland-protocols # Hyprland protocols
    wlroots # Wayland compositor
    poppler # PDF library
    poppler_utils # PDF library
    winetricks # Wine utility
    wineWowPackages.waylandFull # Wine utility
    tree # Directory tree

    ########### Utility / Quality of Life / Useful Commands

    testdisk # Data recovery
    nixfmt-rfc-style # Nix formatter
    zoxide # Directory jumper
    opendrop # Airdrop compatibility
    hping # DoS tool
    nmap # Network scanner
    entr # Code runner
    jc # JSON parser
    jq # JSON parser
    fzf # Fuzzy File Finder
    protonup # Proton updater
    bash-completion # Terminal completion
    bat # Cat clone
    tesseract # Image OCR
    ocrmypdf # PDF OCR
    exfatprogs # Exfat utilities
    exfat # Exfat utilities

    ########### Programs & Apps

    hakuneko # Manga Downloader
    qdirstat # Disk usage analyzer
    gparted # Partition manager
    telegram-desktop # Messaging app
    yazi # Terminal file manager
    geogebra # Math tool
    docker # Container manager
    drawio # Diagram editor # Disabled due to error 
    webcord # Discord client
    lutris # Game client
    heroic # Game client
    steam # Game client
    firefox # Browser
    vlc # Media player
    obs-studio # Media creator / Streaming software
    mongosh # MongoDB shell
    rofi-wayland # App launcher
    eww # Widget manager
    zathura # PDF viewer
    vscode # Code editor
    obsidian # Note taking app
    cider-2 # Apple Music client
    unityhub # Unity IDE
    libreoffice-qt-fresh # Office suite
    qbittorrent # Torrent client
    zoom-us # Video conferencing
    postman # API client

    ############ Disabled programs ( Mostly for gaining space )
    
    # android-studio # Android IDE
    #jetbrains.idea-ultimate # IDE
  ];
}
