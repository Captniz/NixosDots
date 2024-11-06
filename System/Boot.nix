{ config, lib, pkgs, systemSettings, ...}:

{
  # Bootloader.
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
  };
}