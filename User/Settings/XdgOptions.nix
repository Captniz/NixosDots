{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  xdg.desktopEntries.yazi = {
    name = "Yazi";
    genericName = "File Manager";
    comment = "Blazing fast terminal file manager written in Rust";
    exec = "alacritty -e yazi %u"; # or alacritty -e yazi %u
    terminal = false;
    icon = "yazi";
    categories = [
      "Utility"
      "System"
      "FileManager"
      "Core"
      "FileTools"
      "ConsoleOnly"
    ];
    keywords = [
      "File"
      "Manager"
      "Explorer"
      "Browser"
      "Launcher"
    ];
    mimeType = [ "inode/directory" ];
  };
}
