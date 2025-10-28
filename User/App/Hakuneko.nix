{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  # Fixes hakuneko not opening because of sandboxing
  xdg.desktopEntries.hakuneko-desktop = {
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
}
