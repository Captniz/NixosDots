{ config, lib, pkgs, ...}:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; 
      dedicatedServer.openFirewall = true;
    };

    gamemode.enable = true;
    light.enable = true;
    
    zsh = {
      enable = true;
    };
    
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}