{ config, lib, pkgs, systemSettings, ...}:

{
  # Bootloader.
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}