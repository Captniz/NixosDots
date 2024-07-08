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
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
    
    nvidia.modesetting.enable = true;
  };
  
  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ext4";
  };
}