{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  powerManagement.resumeCommands = ''
    notify-send "Resuming from suspend;hyprctl dispatch dpms on"
  '';

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=yes
  '';

  services = {
    logind.settings = {
      Login.HandleLidSwitchDocked = "ignore";
      Login.HandleLidSwitchExternalPower = "ignore";
      Login.HandleLidSwitch = "ignore";
      Login.HandlePowerKey = "lock";
      Login.HandlePowerKeyLongPress = "poweroff";

    };
    upower = {
      enable = true;
      allowRiskyCriticalPowerAction = true;
      percentageLow = 25;
      percentageCritical = 10;
      percentageAction = 4;
      usePercentageForPolicy = true;
      criticalPowerAction = "HybridSleep";
    };
  };

  systemd.user.services."battery-notify" = {
    description = "Battery notifications ";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Environment = "PATH=/run/current-system/sw/bin:/run/current-system/sw/sbin:/usr/bin:/bin";
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/User/Scripts/NotifyBattery.sh";
    };
  };
}
