{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simo = {
    isNormalUser = true;
    description = "Simone";
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "audio"
      "sound"
      "video"
      "docker"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };
}
