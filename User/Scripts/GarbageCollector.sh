#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="/var/log/nixos-gc.log"
: > "$LOG_FILE"
ERROR_SECTION=""
GC_AGE="7"

log() {
  # Print to both the terminal and the log file
  echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

handle_error() {
  log "❌ ERROR: $ERROR_SECTION failed. See log for details: $LOG_FILE"
  exit 1
}

trap 'handle_error' ERR

if [[ -n "${1-}" ]]; then
  GC_AGE="$1"
fi

log "
######################################\n
#  [Nix GC] Starting full cleanup  #\n
######################################\n"

# --- 1️⃣ Expire Home Manager generations (for your user) ---
log "\n\n [Nix GC] Expiring Home-Manager generations  \n"
ERROR_SECTION="=== Home Manager expire generations ==="

if command -v home-manager >/dev/null 2>&1; then
  home-manager expire-generations "-${GC_AGE} days" 2>&1 | tee -a "$LOG_FILE"
else
  log "[Nix GC] home-manager not found, skipping..."
fi

# --- 2️⃣ Run user-level GC ---
log "\n\n [Nix GC] Running user-level GC \n"
ERROR_SECTION="=== User level GC ==="

nix-collect-garbage --delete-older-than "${GC_AGE}d" 2>&1 | tee -a "$LOG_FILE"

# --- 3️⃣ Run system-level GC ---
log "\n\n󰍹 [Nix GC] Running system-level GC 󰍹\n"
ERROR_SECTION="=== System level GC ==="

sudo nix-collect-garbage --delete-older-than "${GC_AGE}d" 2>&1 | tee -a "$LOG_FILE"

ERROR_SECTION=""
log "\n\n Garbage completed successfully! \n\n"

# --- 4️⃣ Optional Nix store optimization ---
echo ""
read -r -p "🧹 Do you also want to run nix-store --optimise? [Y/n]: " answer
answer="${answer:-Y}"

if [[ "$answer" =~ ^[Yy]$ ]]; then
  log "⚙️  Running nix-store --optimise..."
  sudo nix-store --optimise 2>&1 | tee -a "$LOG_FILE"
  log " Store optimization completed."
else
  log "⏩ Skipping nix-store optimization."
fi

log "\n\n☑️ All tasks complete. ☑️\n󰕹 Good Luck! 󰕹"
