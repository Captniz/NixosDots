{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:
{
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.yazi}/bin/nemo";
      };
    };
  };
}
