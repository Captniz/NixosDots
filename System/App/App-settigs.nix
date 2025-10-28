{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    ./Sddm.nix
    ./Steam.nix
    ./Wireshark.nix
    ./Zsh.nix
    ./Docker.nix
    ./Databases.nix
    ./OpenSSH.nix
  ];
}
