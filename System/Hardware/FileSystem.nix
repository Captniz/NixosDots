{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:
{
  services = {
    udisks2.enable = true;
    # Kindle Paperwhite udev rules
    udev.extraRules = ''
      # Kindle Paperwhite USB permissions
      SUBSYSTEM=="usb", ATTR{idVendor}=="1949", MODE="0666"
    '';
  };

  # Partition to be mounted trough fstab
  fileSystems = {
    "/mnt/Storage" = {
      device = "/dev/disk/by-label/Storage";
      fsType = "ext4";
    };
  };

  # System swap file
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 24 * 1024;
    }
  ];

  # Nix Garbage collection settings
  systemd = {
    timers."nix-full-gc" = {
      description = "Weekly Nix full garbage collection";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "weekly";
        Persistent = true;
        RandomizedDelaySec = "20m"; # spread load if multiple machines
      };
    };
    services."nix-full-gc" = {
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
}
