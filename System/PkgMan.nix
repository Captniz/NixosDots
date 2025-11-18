{
  config,
  lib,
  pkgs,
  systemSettings,
  inputs,
  ...
}:

{
  # Enable AppImage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Allow unfree packages and specific insecure packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "the_electron_version"
      "electron-36.9.5"
    ];
  };

  # Nix store optimisations
  nix = {
    optimise = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    };
  };

  # System packages
  environment.systemPackages = with pkgs; [
    ########### Errored

    #vcpkg # C++ package manager
    #vcpkg-tool # C++ package manager
    (pkgs.jdk.override { enableJavaFX = false; }) # Java
    #drawio # Diagram editor
    #kdePackages.xwaylandvideobridge # Xwayland bridge

    ########### Testing

    ########### Essentials

    zip # Archive manager
    udisks # Disk manager
    wl-clip-persist # Clipboard manager
    wl-clipboard # Clipboard manager
    cliphist # Clipboard manager
    hyprlock # Screen locker
    hyprland # Window manager
    zsh # Shell
    dunst # Notification manager
    pipewire # Audio server
    wireplumber # Audio server
    pavucontrol # Audio control
    light # Brightness control
    neovim # Text editor
    alacritty # Term. emulator
    git # Version manager
    swww # Wallpaper manager
    qimgv # Image viewer
    fastfetch # System fetch
    btop # System monitor
    p7zip # Archive manager
    unrar # Archive manager
    unzip # Archive manager
    ueberzugpp # Terminal Image viewer
    wev # Input event viewer
    mupdf # PDF viewer
    polkit # Authorization manager
    polkit_gnome # Authorization manager
    upower # Power management

    ########### Languages

    biome # JavaScript/TypeScript linter
    pnpm # Node.js package manager
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
    php # PHP
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

    ########### Dependencies/Libraries

    bind
    fuse
    libmtp # MTP support
    simple-mtpfs # MTP support
    hyprland-qtutils # Hyprland Qt support
    hyprland-qt-support # Hyprland Qt support
    libnotify # Notification library
    glib # C library
    kdePackages.qtdeclarative
    libinput # Input library
    owl # Owl library
    alsa-utils # Audio utilities
    webkitgtk_6_0 # Webkit
    dxvk # DirectX to Vulkan translation layer
    doxygen # Documentation generator
    alsa-ucm-conf # ALSA UCM configuration
    sof-firmware # Sound Open Firmware
    libsForQt5.qt5.qtdeclarative
    libsForQt5.qt5.qtmultimedia
    kdePackages.qtmultimedia
    libsForQt5.qt5.qtquickcontrols # Qt5 libraries
    libsForQt5.qt5.qtgraphicaleffects # Qt5 libraries
    libsForQt5.qt5.qtwayland # Qt5 libraries
    git-credential-oauth # Git credential helper
    xdg-desktop-portal-gtk # Desktop utilities
    xdg-desktop-portal-hyprland # Desktop utilities
    xdg-desktop-portal-wlr # Desktop utilities
    xdg-desktop-portal # Desktop utilities
    kdePackages.xdg-desktop-portal-kde # Desktop utilities
    xorg.xhost # Xorg utility
    hyprland-protocols # Hyprland protocols
    wlroots # Wayland compositor
    poppler # PDF library
    poppler-utils # PDF library
    winetricks # Wine utility
    wineWowPackages.waylandFull # Wine utility

    ########### Utility / Quality of Life / Useful Commands

    playerctl # Media controller
    swappy # Screenshot annotation tool
    traceroute # Network diagnostic
    xdg-utils # Desktop utilities
    grim # Screenshot tool
    ripgrep # Text searcher
    woeusb # Windows USB creator
    fd # Find utility
    glow # Markdown previewer
    slurp # Screen Region selector
    file # File type checker
    tree # Directory tree
    cifs-utils # CIFS utilities
    valgrind # Memory debugging
    testdisk # Data recovery
    nixfmt-rfc-style # Nix formatter
    zoxide # Directory jumper
    entr # Code runner
    jc # JSON parser
    jq # JSON parser
    fzf # Fuzzy File Finder
    protonup-ng # Proton updater
    nmap # Network scanner
    bash-completion # Terminal completion
    bat # Cat clone
    tesseract # Image OCR
    ocrmypdf # PDF OCR
    exfatprogs # Exfat utilities
    exfat # Exfat utilities
    udisks # Disk management utility
    dysk # Disk usage analyzer
    pastel # Color utility

    ########### Programs & Apps

    powertop # Power management
    gimp3 # Image editor
    localsend # File transfer app
    calibre # Ebook manager
    hakuneko # Manga Downloader
    inputs.zen-browser.packages."${systemSettings.system}".default # Browser
    qdirstat # Disk usage analyzer
    gparted # Partition manager
    telegram-desktop # Messaging app
    inputs.quickshell.packages."${systemSettings.system}".default # Widgets and bar
    font-manager # Font viewer
    yazi # Terminal file manager
    geogebra # Math tool
    docker # Container manager
    webcord # Discord client
    lutris # Game client
    heroic # Game client
    steam # Game client
    vlc # Media player
    obs-studio # Media creator / Streaming software
    mongosh # MongoDB shell
    rofi # App launcher
    zathura # PDF viewer
    vscode # Code editor
    obsidian # Note taking app
    cider-2 # Apple Music client
    unityhub # Unity IDE
    libreoffice-qt-fresh # Office suite
    qbittorrent # Torrent client
    zoom-us # Video conferencing
    postman # API client
    dia # Diagram editor
    kcc # Kindle Comic Converter
    wireshark # Network protocol analyzer
    zotero # Reference manager

    ############ Disabled programs ( Mostly for gaining space )

    # android-studio # Android IDE
    # jetbrains.idea-ultimate # IDE
  ];
}
