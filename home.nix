{ config, pkgs, ... }:

{
  imports = [ 
    ./User/Settings/Style.nix
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
  ];

  # Home config
  home.username = "simo";
  home.homeDirectory = "/home/simo";
  
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  home.packages = with pkgs;  [
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  gtk.enable = true;
  programs.home-manager.enable = true;
}
