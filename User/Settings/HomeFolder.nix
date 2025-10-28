{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  xdg.userDirs = {
    enable = true;
    download = "${config.home.homeDirectory}/Downloads";
    pictures = "${config.home.homeDirectory}/Images";
  };
  
  # Home files
  home.file = {
    "Trash" = {
      source = "${config.home.homeDirectory}/.local/share/Trash";
      target = "${config.home.homeDirectory}/Trash";
      recursive = true;
    };
  };
}
