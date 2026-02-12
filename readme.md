# Dotfiles

Some niri config for arch.

## Screenshots

<p align="center">
  <img src="screenshots/lockscreen.png" width="500" alt="Lock Screen">
</p>

<p align="center">
  <img src="screenshots/homepage.png" width="500" alt="Home Screen">
</p>

<p align="center">
  <img src="screenshots/Niri scrolling tiling 1.png" width="500" alt="Niri Window Mangaer">
</p>

<p align="center">
  <img src="screenshots/Niri scrolling tiling 2.png" width="500" alt="Niri Window Mangaer">
</p>

<p align="center">
  <img src="screenshots/peaclock.png" width="500" alt="Peaclock">
</p>

## Demo

[![Watch the demo](https://img.youtube.com/vi/jh_z4gddL-A/maxresdefault.jpg)](https://youtu.be/jh_z4gddL-A)

## Core Stack

- **Compositors:** Hyprland & Niri
- **Editor:** Neovim
- **Shell:** Zsh + Oh My Posh
- **Terminal:** Kitty + Tmux
- **Keyboard:** Kanata (remaps)
- **File Manager:** Yazi

## Progress

- [x] Core Compositors (Hyprland / Niri)
- [x] Terminal Stack (Kitty, Tmux, Zsh)
- [x] Editor (Neovim)
- [x] Keyboard Mapping (Kanata)
- [x] System Locking (Hyprlock / Swaylock)
- [x] Display Manager (SDDM)
- [x] File Management (Yazi)
- [ ] Notifications
- [ ] OSD (On-Screen Display)
- [ ] Hyprland re-setup (broken after the window-rule update)

> **Note:** This setup is intentionally bar-less. Information is accessed via peaclock and btop.

## Installation

```bash
git clone https://github.com/Cards29/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow <package_name>
```

## License

MIT
