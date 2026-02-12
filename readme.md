# Dotfiles

Some niri config for arch.

## Screenshots

<p align="center">
<h3>Hyprlock can be beautiful, who knew</h3>
  <img src="screenshots/lockscreen.png" width="500" alt="Lock Screen">
</p>

<p align="center">
<h3>Home page with nothing</h3>
  <img src="screenshots/homepage.png" width="500" alt="Home Screen">
</p>

<p align="center">
<h3>Just showing niri overview</h3>
  <img src="screenshots/Niri scrolling tiling 1.png" width="500" alt="Niri Window Mangaer">
</p>

<p align="center">
<h3>Just showing niri overview 2</h3>
  <img src="screenshots/Niri scrolling tiling 2.png" width="500" alt="Niri Window Mangaer">
</p>

<p align="center">
<h3>Peaclock, Amazing cli tool, absolutely beautiful</h3>
  <img src="screenshots/peaclock.png" width="500" alt="Peaclock">
</p>

## Demo

<h3>Click to watch</h3>
[![Watch the demo](https://img.youtube.com/vi/koUdmD0984U/maxresdefault.jpg)](https://youtu.be/koUdmD0984U)

## Core Stack

- **Compositors:** Hyprland & Niri
- **Editor:** Neovim
- **Shell:** Zsh + Oh My Posh (looks like p10k pure, so its good)
- **Terminal:** Kitty + Tmux
- **Keyboard:** Kanata
- **File Manager:** Yazi
- **Wallpaper Engine:** swww

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
