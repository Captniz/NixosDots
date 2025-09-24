{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  swapDevices = [ 
    {
      device = "/var/lib/swapfile";
      size = 24*1024;
    } 
  ];


  hardware = {

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    nvidia.modesetting.enable = true;
  };

  powerManagement.resumeCommands = ''
    notify-send "Resuming from suspend;hyprctl dispatch dpms on"
  '';

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=yes
  '';

  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ext4";
  };
}
