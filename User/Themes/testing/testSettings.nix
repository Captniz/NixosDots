{ config, pkgs, lib, ... }:

{
  programs.alacritty.settings.font.size = lib.mkForce 20;
}