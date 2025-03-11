{
  config,
  lib,
  pkgs,
  systemSettings,
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

    #libsForQt5.xwaylandvideobridge   # Recently udpated, could fix some issues

    ########### Testing

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
    jdk # Java
    (pkgs.python3.withPackages (python-pkgs: [
      # Python
      python-pkgs.pandas
      python-pkgs.requests
      python-pkgs.setuptools
      python-pkgs.toml
    ]))
    polyml # ML

    ########### Dependencies/Libraries/Single Use Programs

    libinput # Input library
    owl
    alsa-utils # Audio utilities
    webkitgtk # Webkit
    dxvk
    doxygen # Documentation generator
    mupdf
    alsa-ucm-conf
    sof-firmware
    wev
    libsForQt5.qt5.qtquickcontrols # Qt5 libraries
    libsForQt5.qt5.qtgraphicaleffects # Qt5 libraries
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
    qdirstat # Disk usage analyzer
    gparted # Partition manager

    ########### Programs & Apps

    telegram-desktop # Messaging app
    yazi # Terminal file manager
    geogebra # Math tool
    docker # Container manager
    webcord # Discord client
    lutris # Game client
    heroic # Game client
    steam # Game client
    firefox # Browser
    drawio # Diagram editor
    vlc # Media player
    obs-studio # Media creator / Streaming software
    rofi-wayland # App launcher
    eww # Widget manager
    zathura # PDF viewer
    android-studio # Android IDE
    vscode # Code editor
    obsidian # Note taking app
    cider-2 # Apple Music client
    unityhub # Unity IDE
    libreoffice-qt-fresh # Office suite
    qbittorrent # Torrent client
    zoom-us # Video conferencing
  ];
}
