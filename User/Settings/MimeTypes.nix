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
      "text/xml" = [ "zen-beta.desktop" ]; # Browser
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
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
        "impress.desktop"
      ]; # PowerPoint documents

      # Web
      "default-web-browser" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ]; # Browser
      "application/x-extension-shtml" = [ "zen-beta.desktop" ];
      "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" ];
      "application/x-extension-xht" = [ "zen-beta.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-beta.desktop" ];
      "x-scheme-handler/mailto" = [ "zen-beta.desktop" ];
      "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "application/xhtml+xml" = [ "zen-beta.desktop" ];

      # Images
      "image/jpeg" = [ "qimgv.desktop" ]; # Images
      "image/jpg" = [ "qimgv.desktop" ]; # Images
      "image/png" = [ "qimgv.desktop" ]; # Images
    };
  };
}
