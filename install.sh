#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${HOME}/dotfiles_backup_$(date +%F_%H%M%S)"

echo "[*] Backup dir: ${BACKUP_DIR}"
mkdir -p "${BACKUP_DIR}"

# Packages for Arch + Hyprland stack
PKG_CORE=(
  base-devel git curl wget zip unzip ripgrep fd fzf zoxide starship
  hyprland hyprpaper hypridle hyprlock
  waybar wofi rofi-wayland dunst swaync
  kitty alacritty foot
  pipewire pipewire-alsa pipewire-pulse wireplumber pavucontrol
  wl-clipboard grim slurp swappy
  brightnessctl playerctl network-manager-applet blueman bluez bluez-utils
  xdg-desktop-portal-hyprland polkit-gnome gvfs gvfs-mtp udiskie
  ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji
  fastfetch neovim tmux btop
)

echo "[*] Installing core packages with pacman (requires sudo)"
if command -v pacman >/dev/null 2>&1; then
  sudo pacman -Syu --needed --noconfirm "${PKG_CORE[@]}"
else
  echo "[!] pacman not found. Skip package install."
fi

echo "[*] Linking dotfiles"
link_item() {
  local src="$1"
  local dst="$2"
  if [ -e "${dst}" ] || [ -L "${dst}" ]; then
    mkdir -p "$(dirname "${BACKUP_DIR}/${dst#${HOME}/}")"
    mv -f "${dst}" "${BACKUP_DIR}/${dst#${HOME}/}" 2>/dev/null || true
  fi
  mkdir -p "$(dirname "${dst}")"
  ln -s "${src}" "${dst}"
}

# Link .config subtree
if [ -d "${REPO_DIR}/.config" ]; then
  find "${REPO_DIR}/.config" -mindepth 1 -maxdepth 1 -type d | while read -r d; do
    name="$(basename "$d")"
    link_item "$d" "${HOME}/.config/${name}"
  done
fi

# Link .local/bin
if [ -d "${REPO_DIR}/.local/bin" ]; then
  mkdir -p "${HOME}/.local/bin"
  find "${REPO_DIR}/.local/bin" -type f -perm -u+x -o -type f | while read -r f; do
    link_item "$f" "${HOME}/.local/bin/$(basename "$f")"
    chmod +x "${HOME}/.local/bin/$(basename "$f")" 2>/dev/null || true
  done
fi

# Link other top-level dotfiles starting with a dot
find "${REPO_DIR}" -maxdepth 1 -type f -name ".*" ! -name ".git*" | while read -r f; do
  base="$(basename "$f")"
  link_item "$f" "${HOME}/${base}"
done

echo "[*] Done. Relogin into Hyprland if needed."
