{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./System/PkgMan.nix
    ./System/Locale.nix
    ./System/Networking.nix
    ./System/Services.nix
    ./System/EnVars.nix
    ./System/Hardware.nix
    ./System/ProgramSettings.nix
    ./System/Users.nix
    ./System/Security.nix
    ./System/Boot.nix
    ./System/App/Cider.nix
  ];

  #Enable experimental features
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    warn-dirty = false;
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
