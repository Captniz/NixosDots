{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
}
