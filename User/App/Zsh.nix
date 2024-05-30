{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
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
        red =     colors.red;
        orange =  colors.orange;
        yellow =  colors.yellow;
        green =   colors.green;
        cyan =    colors.aqua;
        blue =    colors.blue;
        purple =  colors.purple;
        black =   colors.black;
        white =   colors.white;
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
      flakeup = "nix flake lock --update-input nixpkgs /etc/nixos ; nix flake update /etc/nixos";
      homeup = "home-manager switch --flake /etc/nixos --impure";
      nixup = "sudo nixos-rebuild switch --flake /etc/nixos";
      nixconfigure = "code /etc/nixos";
      nixdeleteolder = "sudo nix-collect-garbage --delete-older-than";
      zip = "7z a -r -tzip";
      ocr = "/etc/nixos/User/Scripts/OcrTextExtractor.sh";
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