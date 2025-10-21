{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{

  # Custom .desktop entries, mainly needed to fix xdg-open fucking with terminal apps
  xdg.desktopEntries = {
    yazi = {
      name = "Yazi";
      exec = "alacritty -e yazi %u"; # or alacritty -e yazi %u
      icon = "yazi";
      type = "Application";
      comment = "Blazing fast terminal file manager written in Rust";
      genericName = "File Manager";
      terminal = false;
      categories = [
        "Utility"
        "System"
        "FileManager"
        "Core"
        "FileTools"
        "ConsoleOnly"
      ];
      settings = {
        Keywords = "File;Manager;Explorer;Browser;Launcher";
      };
      mimeType = [ "inode/directory" ];
    };

    nvim = {
      name = "Neovim";
      exec = "alacritty -e nvim %F"; # or alacritty -e nvim %F
      icon = "nvim";
      type = "Application";
      comment = "Neovim is a hyperextensible Vim-based text editor";
      genericName = "Text Editor";
      terminal = false;
      categories = [
        "Utility"
        "TextEditor"
        "Development"
        "IDE"
        "ConsoleOnly"
      ];
      settings = {
        Keywords = "Text;editor;Editor;Code;IDE;Development;Vim";
      };
      mimeType = [ "text/plain" ];
    };

    hakuneko-desktop = {
      name = "HakuNeko Desktop";
      exec = "hakuneko --no-sandbox";
      icon = "hakuneko-desktop";
      type = "Application";
      genericName = "Manga & Anime Downloader";
      terminal = false;
      categories = [
        "Network"
        "FileTransfer"
      ];
    };
  };

  xdg.userDirs = {
    enable = true;
    download = "${config.home.homeDirectory}/Downloads";
    pictures = "${config.home.homeDirectory}/Images";
  };

  # Set default applications for various mime types
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # File manager
      "inode/directory" = [ "yazi.desktop" ]; # File manager

      # Documents
      "text/xml" = [ "firefox.desktop" ]; # Browser
      "text/plain" = [ "nvim.desktop" ]; # Text files
      "text/markdown" = [ "nvim.desktop" ]; # Text files
      "application/pdf" = [ "org.pwmt.zathura.desktop" ]; # PDF
      "application/epub+zip" = [ "org.pwmt.zathura.desktop" ]; # Epub
      "application/json" = [ "nvim.desktop" ];
      "application/x-yaml" = [ "nvim.desktop" ];

      # Web
      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ]; # Browser
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];

      # Images
      "image/jpeg" = [ "qimgv.desktop" ]; # Images
      "image/jpg" = [ "qimgv.desktop" ]; # Images
      "image/png" = [ "qimgv.desktop" ]; # Images
    };
  };
}
