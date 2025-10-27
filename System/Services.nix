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
    udisks2.enable = true;
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
          Environment = "PATH=/run/current-system/sw/bin:/run/current-system/sw/sbin:/usr/bin:/bin";
          ExecStart = pkgs.writeShellScript "nix-full-gc" ''
            set -euo pipefail

            LOG_FILE="/var/log/nixos-gc.log"
            : > "$LOG_FILE"
            ERROR_SECTION=""

            log() {
              echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
            }

            handle_error() {
              log "❌ ERROR: $ERROR_SECTION failed. See log for details: $LOG_FILE"
              exit 1
            }

            trap 'handle_error' ERR

            # --- Home Manager generations ---
            ERROR_SECTION="Home Manager expire generations"
            log " [Nix GC] Expiring Home Manager generations "
            /run/current-system/sw/sbin/runuser -l ${userSettings.username} -c "home-manager expire-generations '-7 days'" >>"$LOG_FILE" 2>&1


            # --- User-level GC ---
            ERROR_SECTION="User level GC"
            log " [Nix GC] Running user-level GC "
            /run/current-system/sw/sbin/runuser -l ${userSettings.username} -c "nix-collect-garbage --delete-older-than 7d" >>"$LOG_FILE" 2>&1

            # --- System-level GC ---
            ERROR_SECTION="System level GC"
            log "󰍹 [Nix GC] Running system-level GC 󰍹"
            nix-collect-garbage --delete-older-than 7d >>"$LOG_FILE" 2>&1

            ERROR_SECTION=""
            log " Garbage collection complete! "
            log "✅ GC completed successfully!"
            log "󰕹 Good Luck! 󰕹"
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
