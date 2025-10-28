{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };
}
