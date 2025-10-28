{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  # Configuration modules
  imports = [
    # General Settings
    ./User/Settings/Style.nix
    ./User/Settings/MimeTypes.nix
    ./User/Settings/HomeFolder.nix

    # App settings
    ./User/App/Hyprland.nix
    ./User/App/Dunst.nix
    ./User/App/Rofi.nix
    ./User/App/Btop.nix
    ./User/App/Zsh.nix
    ./User/App/Alacritty.nix
    ./User/App/Zathura.nix
    ./User/App/Git.nix
    ./User/App/Eww.nix
    ./User/App/Vscode.nix
    ./User/App/Hyprlock.nix
    ./User/App/Firefox.nix
    ./User/App/Yazi.nix
    ./User/App/HyprIdle.nix
    ./User/App/Nvim.nix
    ./User/App/Hakuneko.nix
    ./User/App/Swww.nix
    ./User/App/Clipboard.nix
    ./User/App/Polkit.nix
    #./User/App/Obsidian.nix
  ];

  # Home config
  home.username = userSettings.username;
  home.homeDirectory = "/home/simo";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
