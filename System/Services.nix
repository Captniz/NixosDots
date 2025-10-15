{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  services = {
    xserver.videoDrivers = [ "amdgpu" ];

    pipewire = {
      enable = true;
      systemWide = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [
              "hsp_hs"
              "hsp_ag"
              "hfp_hf"
              "hfp_ag"
            ];
          };
        };
      };
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    gnome.gnome-keyring.enable = true;

    displayManager.ly = {
      enable = true;
      settings = {
        animation = "colormix";
        animation_timeout_sec = 0;
        auth_fails = 3;
        battery_id = "BAT1";
        bigclock = "en";
        bigclock_12hr = false;
        bigclock_seconds = false;
        clear_password = true;
        clock = "%c";
        full_color = true;
        bg = "0x00111111";
        colormix_col3 = "0x88aa99";
        colormix_col1 = "0x448888";
        colormix_col2 = "0x006677";
        session_log = "./.ly.log";
      };
    };

    logind.settings = {
      Login.HandleLidSwitchDocked = "ignore";
      Login.HandleLidSwitchExternalPower = "ignore";
      Login.HandleLidSwitch = "ignore";
      Login.HandlePowerKey = "lock";
      Login.HandlePowerKeyLongPress = "poweroff";
    };

    postgresql = {
      enable = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };

    udev.extraRules = ''
      # Kindle Paperwhite USB permissions
      SUBSYSTEM=="usb", ATTR{idVendor}=="1949", MODE="0666"
    '';

    upower = {
      enable = true;
      allowRiskyCriticalPowerAction = true;
      percentageLow = 25;
      percentageCritical = 10;
      percentageAction = 4;
      usePercentageForPolicy = true;
      criticalPowerAction = "HybridSleep";
    };

    blueman = {
      enable = true;
    };

    mongodb = {
      enable = true;
      package = pkgs.mongodb-ce;
    };
  };

  systemd.user.services = {
    pipewire-pulse.path = [ pkgs.pulseaudio ];
    polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    mpris-proxy = {
      description = "Mpris proxy";
      after = [
        "network.target"
        "sound.target"
      ];
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
  };
}
