# Arch Hyprland Dots — merged

This pack merges multiple dot sources into a single, symlink‑ready layout.

## Install
```bash
git clone <this-zip-extract> ~/arch-hyprland-dots-merged
cd ~/arch-hyprland-dots-merged
./install.sh
```

The script backs up existing files to `~/dotfiles_backup_YYYY-MM-DD_HHMMSS`, installs core Arch packages, and symlinks configs.

## Structure
- `.config/*` → Hyprland, Waybar, wofi/rofi, kitty/alacritty, dunst/swaync, nvim, etc.
- `.local/bin/*` → user scripts
- Top‑level dotfiles like `.zshrc`, `.gitconfig`, `.tmux.conf`

Generated: 2025-10-23T20:58:30.642723
