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

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./App/Sddm.nix { inherit pkgs; }}";
    };

    logind = {
      lidSwitch = "ignore";
      lidSwitchDocked = "ignore";
      lidSwitchExternalPower = "ignore";
    };

    postgresql = {
      enable = true;
      ensureDatabases = [ "mydatabase" ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };

    blueman = {
      enable = true;
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
