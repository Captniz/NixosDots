{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
}
