{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    ./FileSystem.nix
    ./Audio.nix
    ./Bluetooth.nix
    ./Video.nix
    ./Power.nix
    ./Networking.nix
  ];
}
