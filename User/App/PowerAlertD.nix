{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  services.poweralertd = {
    enable = true;
  };
}