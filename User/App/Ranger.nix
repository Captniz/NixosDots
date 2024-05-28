{ config, lib, pkgs, ...}:

{
  home.file."~/.config/ranger/commands.py" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/ranger/commands.py";
  };
  home.file."~/.config/ranger/commands_full.py" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/ranger/commands_full.py";
  };
  home.file."~/.config/ranger/rc.conf" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/ranger/rc.conf";
  };
  home.file."~/.config/ranger/rifle.conf" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/ranger/rifle.conf";
  };
  home.file."~/.config/ranger/scope.sh" = {
    enable = true;
    source = "/etc/nixos/User/ExtraConfigs/ranger/scope.sh";
  };  
}