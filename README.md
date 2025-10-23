# 🌌 Arch Linux — Hyprland Dotfiles Combo  

A unified, optimized configuration suite built from a fusion of **my personal setup**, **end-4’s dotfiles**, and **Caelestia**.  
Every component has been standardized, restructured, and interconnected for a clean, elegant, and fully functional Hyprland experience.

---

## 🧩 Overview  
This repository merges multiple independent dotfile collections into a cohesive, modular, and symlink-ready structure designed for **Arch Linux + Hyprland**.  
It adheres to the **XDG Base Directory Specification** and includes all essential components for a complete Wayland workflow.

**Included modules:**  
- 🌀 **Hyprland** — core configuration, keybinds, autostart, environment  
- 🎛️ **Waybar** — status bar with system modules  
- 🔍 **Wofi / Rofi** — lightweight app launcher  
- 💬 **Dunst / SwayNC** — notification system  
- 💻 **Kitty / Alacritty / Foot** — terminal emulators  
- ⚙️ **Neovim / Fastfetch / Btop / Tmux** — productivity tools  
- 🎨 **GTK / QT themes, fonts, icons**  
- 🔒 **Hyprlock / Hypridle** — lock and idle management  
- 🖼️ **Wallpapers & scripts**  
- 🐚 Shell configuration: `.zshrc`, `.bashrc`, `.p10k.zsh`, `.tmux.conf`, `.gitconfig`, etc.  

---

## ⚙️ Directory Structure  

~/.config/
├─ hypr/ → Hyprland main config
├─ waybar/ → bar styling + modules
├─ wofi/ | rofi/ → launcher configuration
├─ kitty/ | alacritty/ | foot/
├─ nvim/
├─ dunst/ | swaync/
├─ hyprlock/ | hypridle/
├─ gtk-3.0/ | gtk-4.0/ | qt5ct/
├─ btop/ | tmux/
└─ ...
~/.local/
├─ bin/ → user scripts
└─ share/ → icons, themes, wallpapers
~/
├─ .zshrc / .bashrc / .tmux.conf / .gitconfig
└─ .p10k.zsh / .profile / etc.


---

## 🚀 Installation  

```bash
git clone https://github.com/<yourname>/arch-hyprland-dots.git ~/arch-hyprland-dots
cd ~/arch-hyprland-dots
chmod +x install.sh
./install.sh
```
The install.sh script will:

    🗂️ Backup your existing dotfiles to ~/dotfiles_backup_<date>

    📦 Install all required Arch packages (if pacman is available)

    🔗 Create symlinks for .config, .local, and home dotfiles

🛠️ Core Packages

The installer ensures these essential packages are installed:

base-devel git curl wget zip unzip ripgrep fd fzf zoxide starship
hyprland hyprpaper hypridle hyprlock
waybar wofi rofi-wayland dunst swaync
kitty alacritty foot
pipewire wireplumber pavucontrol wl-clipboard
grim slurp swappy brightnessctl playerctl network-manager-applet
blueman bluez bluez-utils
xdg-desktop-portal-hyprland polkit-gnome gvfs udiskie
ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji
fastfetch neovim tmux btop

🎨 Design Philosophy

    “Simplicity is the ultimate sophistication.” — Leonardo da Vinci

    Minimal visual noise — clean bar, subtle colors, elegant layout

    Lightweight performance — zero bloat, fast startup

    Full modularity — each module is optional and isolated

    Developer-oriented — optimized for productivity, not eye candy
    
Example layout: Hyprland + Waybar + Wofi + Kitty with JetBrains Mono Nerd Font and dark minimal theme.
📄 License

This configuration is released under the MIT License.
You are free to modify, redistribute, and build upon it with attribution.
🧭 Final Notes

    Compatible with Arch Linux, Artix, EndeavourOS, and other Arch-based systems.

    Can also be ported to Void Linux, Fedora, or NixOS with minor adjustments.

    Recommended GPU: NVIDIA (proprietary driver) or AMD (Mesa) for Wayland compatibility.
