{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{

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
      "application/msword" = [ "writer.desktop" ]; # Word documents
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "writer.desktop" ]; # Word documents
      "application/vnd.ms-excel" = [ "calc.desktop" ]; # Excel documents
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "calc.desktop" ]; # Excel documents
      "application/vnd.ms-powerpoint" = [ "impress.desktop" ]; # PowerPoint documents
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "impress.desktop" ]; # PowerPoint documents

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
