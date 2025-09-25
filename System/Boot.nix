{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  # Bootloader.
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "button.lid_init_state=ignore" ];
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';
  };
}
