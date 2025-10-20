#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="/var/log/nixos-update.log"
ERROR_SECTION=""

log() {
  echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

handle_error() {
  log "❌ ERROR: $ERROR_SECTION failed. See log for details: $LOG_FILE"
  exit 1
}

trap 'handle_error' ERR

# --- Safety check: must be run as root ---
if [[ $EUID -ne 0 ]]; then
  echo " Please run this script as root (e.g., sudo $0) "
  exit 1
fi

# --- Move to NixOS configuration directory ---
cd /etc/nixos
log "🚀 Starting NixOS update process"

echo "=== 󰆓 Pre-update commit 󰆓 ==="
ERROR_SECTION="Pre-update Git commit"
log "=== $ERROR_SECTION ==="
git add . >>"$LOG_FILE" 2>&1
git commit -am '!Pre-update Commit! Last commit before update' >>"$LOG_FILE" 2>&1 || log "No changes to commit."
git push >>"$LOG_FILE" 2>&1

echo "=== 󰌾 Updating flake 󰌾 ==="
ERROR_SECTION="Flake update"
log "=== $ERROR_SECTION ==="
nix flake update --flake /etc/nixos >>"$LOG_FILE" 2>&1

echo "===  Post-update commit  ==="
ERROR_SECTION="Post-update Git commit"
log "=== $ERROR_SECTION ==="
git add . >>"$LOG_FILE" 2>&1
git commit -am '!Breaking changes! System updated' >>"$LOG_FILE" 2>&1 || log "No changes to commit."
git push >>"$LOG_FILE" 2>&1

echo "===   Updating Home Manager configuration   ==="
ERROR_SECTION="Home Manager update"
log "=== $ERROR_SECTION ==="
home-manager switch --flake /etc/nixos --impure >>"$LOG_FILE" 2>&1

echo "=== 󰍹  Updating System (NixOS) configuration 󰍹 ==="
ERROR_SECTION="NixOS rebuild"
log "=== $ERROR_SECTION ==="
sudo nixos-rebuild switch --flake /etc/nixos >>"$LOG_FILE" 2>&1

echo " All updates complete! "
ERROR_SECTION=""
log "✅ Update completed successfully!"
echo "󰕹 Good Luck! 󰕹"
