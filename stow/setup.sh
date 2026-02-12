#!/usr/bin/env zsh
set -euo pipefail

# Script to setup everything (installing all necessary packages),
# should work for a newly installed linux (Ubuntu)


# -----------------------------
# Helpers
# -----------------------------
log()  { printf "\n[INFO] %s\n" "$*"; }
warn() { printf "\n[WARN] %s\n" "$*" >&2; }
err()  { printf "\n[ERR ] %s\n" "$*" >&2; }

have_cmd() { command -v "$1" >/dev/null 2>&1; }

# Install apt packages only if missing
install_apt_if_missing() {
  local pkg missing=()
  for pkg in "$@"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
      missing+=("$pkg")
    fi
  done

  if ((${#missing[@]})); then
    log "Installing missing apt packages: ${missing[*]}"
    apt-get install -y "${missing[@]}"
  else
    log "All requested apt packages already installed: $*"
  fi
}

# Clone repo only if target dir doesn't already exist
clone_if_missing() {
  local repo_url="$1"
  local target_dir="$2"

  if [[ -d "$target_dir/.git" ]]; then
    log "Repo already exists: $target_dir (skipping clone)"
  else
    log "Cloning $repo_url -> $target_dir"
    # Clone as ORIG_USER so github uses user-specific .ssh config
    sudo -u "$ORIG_USER" git clone "$repo_url" "$target_dir" 
  fi
}

# -----------------------------
# Preserve original invoking user/home even after sudo escalation
# -----------------------------
ORIG_USER="${SUDO_USER:-$USER}"
ORIG_HOME="$(getent passwd "$ORIG_USER" | cut -d: -f6)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ -z "$ORIG_HOME" ]]; then
  err "Could not determine home for user '$ORIG_USER'"
  exit 1
fi

# We will need root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script is not running as root. Attempting to re-run with sudo..."
   exec sudo bash "$0"
   exit 99 # Should not reach here if exec is successful
fi

# The rest of your script, which will now run as root
echo "Script is now running as root (EUID is $EUID)."

# Directory from which this script should be run
PWD_DIR=$(pwd)

# -----------------------------
# APT setup
# -----------------------------
if [[ ! -f /etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable*.list ]]; then
  log "Adding neovim unstable PPA"
  add-apt-repository -y ppa:neovim-ppa/unstable
else
  log "Neovim PPA likely already configured (skipping add-apt-repository)"
fi

log "apt-get update"
apt-get update -y

install_apt_if_missing \
  zsh \
  stow \
  tmux \
  git \
  build-essential \
  neovim \
  curl \
  cmake \
  g++ \
  pkg-config \
  libfreetype6-dev \
  libfontconfig1-dev \
  libxcb-xfixes0-dev \
  libxkbcommon-dev \
  python3

# Check if git user.name property is set
if git config --global --get user.name >/dev/null 2>&1; then
  echo "Git user.name is set to: $(git config --global --get user.name). Will keep current value"
else
  echo "Setting git global user.email and user.name properties"
  git config --global user.email "reibell.theo@gmail.com"
  git config --global user.name "Theo Reibell"
fi

# -----------------------------
# Github SSH Authentication Setup
# -----------------------------
#zsh ./setup_github_ssh.sh


# -----------------------------
# Rustup / cargo for original user (not root)
# -----------------------------
if sudo -u "$ORIG_USER" bash -lc 'command -v rustup >/dev/null 2>&1'; then
  log "rustup already installed for $ORIG_USER"
else
  log "Installing rustup for $ORIG_USER"
  sudo -u "$ORIG_USER" bash -lc "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
fi

# Ensure stable toolchain exists/update (idempotent)
sudo -u "$ORIG_USER" bash -lc '
  source "$HOME/.cargo/env"
  rustup toolchain install stable >/dev/null
  rustup default stable >/dev/null
'

# -----------------------------
# Working dirs
# -----------------------------
INSTALLS_DIR="$ORIG_HOME/installs"
mkdir -p "$INSTALLS_DIR"
chown -R "$ORIG_USER:$ORIG_USER" "$INSTALLS_DIR"

# -----------------------------
# Alacritty build/install if missing
# -----------------------------
if have_cmd alacritty; then
  log "Alacritty already installed at $(command -v alacritty) (skipping build/install)"
else
  ALACRITTY_DIR="$INSTALLS_DIR/alacritty"
  clone_if_missing "git@github.com:alacritty/alacritty.git" "$ALACRITTY_DIR"

  log "Building Alacritty"
  sudo -u "$ORIG_USER" bash -lc "
    cd '$ALACRITTY_DIR'
    source '$ORIG_HOME/.cargo/env'
    rustup override set stable
    rustup update stable
    cargo build --release
  "

  log "Installing Alacritty binary"
  install -m 0755 "$ALACRITTY_DIR/target/release/alacritty" /usr/local/bin/alacritty
fi


# -----------------------------
# Config directories in user's home
# -----------------------------
sudo -u "$ORIG_USER" mkdir -p \
  "$ORIG_HOME/.config/nvim" \
  "$ORIG_HOME/.config/alacritty" \
  "$ORIG_HOME/.config/vifm" \
  "$ORIG_HOME/.ssh"

# -----------------------------
# Fonts repo + install OTF files (skip duplicates by hash)
# -----------------------------
FONTS_REPO_DIR="$INSTALLS_DIR/fonts"
clone_if_missing "git@github.com:tricarbonate/fonts.git" "$FONTS_REPO_DIR"

FONT_DEST="/usr/share/fonts/opentype"
mkdir -p "$FONT_DEST"

log "Installing new .otf fonts only"
# Find OTF files and copy only if checksum not already present
while IFS= read -r -d '' f; do
  base="$(basename "$f")"
  target="$FONT_DEST/$base"

  if [[ -f "$target" ]] && cmp -s "$f" "$target"; then
    continue
  fi

  cp -f "$f" "$target"
done < <(find "$FONTS_REPO_DIR" -type f -name '*.otf' -print0)

fc-cache -f >/dev/null 2>&1 || true

# -----------------------------
# Run user's update script with user's privileges
# -----------------------------
if [[ -f "$SCRIPT_DIR/update.sh" ]]; then
  log "Running update.sh as $ORIG_USER"
  sudo -u "$ORIG_USER" bash -lc "cd '$SCRIPT_DIR' && zsh ./update.sh"
else
  warn "update.sh not found in $SCRIPT_DIR (skipping)"
fi

log "Done."
