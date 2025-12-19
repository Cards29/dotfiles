# An AI written readme, sorry I'm lazy

My personal configuration files for a Wayland-based development environment, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Overview

This repository contains configurations for: 

- **hypr** - Hyprland (Wayland compositor)
- **kitty** - Terminal emulator
- **nvim** - Neovim text editor
- **scripts** - Utility scripts
- **tmux** - Terminal multiplexer
- **waybar** - Wayland status bar
- **yazi** - Terminal file manager
- **zsh** - Z shell

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- The applications you want to configure (Hyprland, Neovim, Kitty, etc.)

### Installing Stow

**Arch Linux:**
```bash
sudo pacman -S stow
```

**Debian/Ubuntu:**
```bash
sudo apt install stow
```

**macOS:**
```bash
brew install stow
```

## Installation

1. Clone this repository to your home directory:  
```bash
git clone https://github.com/Cards29/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Use Stow to symlink the configurations you want: 

```bash
stow btop hypr kitty nvim tmux waybar yazi zsh
```

## Usage

### Installing a Package

To install a specific configuration: 
```bash
cd ~/dotfiles
stow <package-name>
```

For example:
```bash
stow waybar
```

This creates symlinks from `~/dotfiles/waybar/` to your `~/.config/` directory.

### Removing a Package

To uninstall a configuration:
```bash
cd ~/dotfiles
stow -D <package-name>
```

### Reinstalling a Package

To reinstall (useful after making changes):
```bash
cd ~/dotfiles
stow -R <package-name>
```

## Structure

Each directory is a Stow package containing the configuration files in their expected directory structure.  For example: 

```
nvim/
└── . config/
    └── nvim/
        ├── init. lua
        └── ... 

kitty/
└── .config/
    └── kitty/
        └── kitty.conf
```

When you run `stow nvim`, it creates symlinks from `~/dotfiles/nvim/. config/nvim/` to `~/.config/nvim/`.

## Notes

- Make sure to backup your existing configurations before stowing
- The repository uses the standard `.config/` structure for most packages
- Stow must be run from the `~/dotfiles` directory
- Each package can be managed independently

## License

MIT
