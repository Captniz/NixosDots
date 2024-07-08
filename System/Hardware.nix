{ config, lib, pkgs, systemSettings, ...}:

{
  hardware = {
    graphics = {
      enable = true;
      #driSupport = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      #bluez = {
      #  enable = true;
      #  plugins = [ pkgs.bluez5.plugins.bluez5 ];
      #};
    };
    nvidia.modesetting.enable = true;
  };
  
  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ext4";
  };
}