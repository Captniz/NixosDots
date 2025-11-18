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
    description = "Simone Tardiani";
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm"
      "audio"
      "sound"
      "video"
      "docker"
      "pipewire"
      "fuse"
      "wireshark"
      "storage"
    ];
    shell = pkgs.zsh;
  };
}
