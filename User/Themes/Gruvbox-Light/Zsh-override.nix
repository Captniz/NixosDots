{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
in
{
  programs.starship = {
    settings = {
      format = lib.mkForce "
[┌](bold cyan)[\\[](purple) $all[\\]](purple)
[└─>](bold cyan)$character$battery";

      character = lib.mkForce {
        success_symbol = "[❯](bold purple)";
        error_symbol = "[!](bold red)[❯](bold red)";
      };
    };
  };
}
