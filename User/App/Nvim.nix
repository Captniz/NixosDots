{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  # Fixes xdg-open and related errors
  xdg.desktopEntries.nvim = {
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
}
