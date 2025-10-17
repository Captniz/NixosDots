{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
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
      package = pkgs.libsForQt5.sddm;
      wayland.enable = true;
      theme = "${import ./App/Sddm.nix { inherit pkgs; }}";
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

  systemd = {
    timers = {
      "nix-full-gc" = {
        description = "Weekly Nix full garbage collection";
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "weekly";
          Persistent = true;
          RandomizedDelaySec = "20m"; # spread load if multiple machines
        };
      };
    };
    services = {
      "nix-full-gc" = {
        description = "Full Nix garbage collection (Home Manager + user + system)";
        serviceConfig = {
          Type = "oneshot";
          ExecStart = pkgs.writeShellScript "nix-full-gc" ''
            set -euo pipefail

            echo "[Nix GC] Starting full cleanup..."

            # --- 1️⃣ Expire Home Manager generations (for your user) ---
            if command -v home-manager >/dev/null 2>&1; then
              echo "[Nix GC] Expiring old Home Manager generations..."
              sudo -u ${userSettings.username} home-manager expire-generations 7d || true
            else
              echo "[Nix GC] home-manager not found, skipping..."
            fi

            # --- 2️⃣ Run user-level GC ---
            echo "[Nix GC] Running user-level GC..."
            sudo -u ${userSettings.username} nix-collect-garbage --delete-older-than 7d || true

            # --- 3️⃣ Run system-level GC ---
            echo "[Nix GC] Running system-level GC..."
            nix-collect-garbage --delete-older-than 7d || true

            echo "[Nix GC] Done."
          '';
        };
      };
    };

    user.services = {
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
  };
}
