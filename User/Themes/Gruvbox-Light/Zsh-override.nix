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
      format = lib.mkForce "[╭─](gray)[](bg:red fg:dim_red)$os$username[](bg:orange fg:red)$directory[](fg:orange bg:yellow)$git_branch$git_status$docker_context[](fg:yellow bg:green)$all[](fg:green bg:cyan)$battery[](fg:cyan bg:blue)$time[ ](fg:blue)$line_break$character
";

      character = lib.mkForce {
        success_symbol = "[❯](bold purple)";
        error_symbol = "[!](bold red)[❯](bold red)";
      };
    };
  };
}
