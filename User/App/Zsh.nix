{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs;  [
    starship
  ];

  programs.starship = {
    enable = true;
    settings = {
      format = "
[┌](orange)[\\[](green) $all[\\]](green)
[└─>](bold orange)$character$battery";

      palette  = "custom";
      palettes.custom = {
        red =     "#cc241d";
        orange =  "#d65d0e";
        yellow =  "#d79921";
        green =   "#98971a";
        cyan =    "#689d6a";
        blue =    "#458588";
        purple =  "#b16286";
        black =   "#282828";
        white =   "#ebdbb2";
      };

      battery = {
        disabled = false;
      };
      line_break = {
        disabled = true;
      };
      add_newline = false;
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      clr = "clear";
      rcat = "cat";
      psqlogin = "sudo -u postgres psql";
      cat = "bat";
      gacp = "git add * ; git commit --all -m '.' ; git push --all";
      flakeup = "nix flake update /etc/nixos";
      homeup = "home-manager switch --flake /etc/nixos --impure";
      nixup = "sudo nixos-rebuild switch";
      nixconfigure = "code /etc/nixos";
      nixdeleteolder = "sudo nix-collect-garbage --delete-older-than";
      zip = "7z a -r -tzip";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "z"
        "starship"
      ];
    };
  };
}