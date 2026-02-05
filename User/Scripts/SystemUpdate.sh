set -euo pipefail

LOG_FILE="/var/log/nixos-update.log"
: > "$LOG_FILE"
ERROR_SECTION=""

ORIG_USER="$USER"
ORIG_HOME="$HOME"


log() {
  echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

handle_error() {
  log "❌ ERROR: $ERROR_SECTION failed. See log for details: $LOG_FILE"
  exit 1
}

trap 'handle_error' ERR

# --- Move to NixOS configuration directory ---
cd /etc/nixos
log "🚀 Starting NixOS update process"

echo "=== 󰆓 Pre-update commit 󰆓 ==="
ERROR_SECTION="Pre-update Git commit"
log "=== $ERROR_SECTION ==="
git add . 2>&1 | tee -a "$LOG_FILE"
git commit -am '!Pre-update Commit! Last commit before update' 2>&1 | tee -a "$LOG_FILE" || log "No changes to commit."
git push 2>&1 | tee -a "$LOG_FILE"

echo "=== 󰌾 Updating flake 󰌾 ==="
ERROR_SECTION="Flake update"
log "=== $ERROR_SECTION ==="
nix flake update --flake /etc/nixos 2>&1 | tee -a "$LOG_FILE"

echo "===  Post-update commit  ==="
ERROR_SECTION="Post-update Git commit"
log "=== $ERROR_SECTION ==="
git add . 2>&1 | tee -a "$LOG_FILE"
git commit -am '!Breaking changes! System updated' 2>&1 | tee -a "$LOG_FILE" || log "No changes to commit."
git push 2>&1 | tee -a "$LOG_FILE"

echo "===   Updating Home Manager configuration   ==="
ERROR_SECTION="Home Manager update"
log "=== $ERROR_SECTION ==="
home-manager switch --flake /etc/nixos --impure 2>&1 | tee -a "$LOG_FILE"

echo "=== 󰍹  Updating System (NixOS) configuration 󰍹 ==="
ERROR_SECTION="NixOS rebuild"
log "=== $ERROR_SECTION ==="
sudo nixos-rebuild switch --flake /etc/nixos 2>&1 | tee -a "$LOG_FILE"

echo " All updates complete! "
ERROR_SECTION=""
log "✅ Update completed successfully!"
echo "󰕹 Good Luck! 󰕹"
