# Omakub

Turn a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. That's the one-line pitch for Omakub. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best.

Watch the introduction video and read more at [omakub.org](https://omakub.org).

## Getting Started

To set up your system with Omakub, run the following command in your terminal:

```bash
git clone https://github.com/phuchoang2603/omakub.git ~/.local/share/omakub
source ~/.local/share/omakub/install.sh
```

This will download and execute the installation script, which will configure your system with all the tools and settings included in this repository.

## Omakub CLI Tool

Omakub includes a powerful CLI tool that provides flexibility for users who want to customize their setup further or add additional components after the initial installation.

- **Theme Installation**: Quickly apply beautiful themes to enhance your desktop environment.
- **Font Installation**: Install a variety of fonts to improve the look and feel of your system.
- **Optional Applications**: Manually install optional applications like Obsidian, OBS Studio, Spotify, and Zotero.
- **Laptop-Specific Packages**: Add packages like Autofreq, Fusuma, and Libinput for better laptop performance and usability.

To use the CLI tool, simply run the following command:

```bash
omakub
```

Follow the interactive prompts to select and install the desired components.

## Applications Pre-installed

Omakub installs and configures the following applications and tools:

- **Terminal Configurations**:
    - Shell setup
    - Git configuration
    - Libraries installation

- **Terminal Applications**:
    - CopyQ
    - Fastfetch
    - Fcitx5
    - GitHub CLI
    - Neovim
    - Rclone
    - Rustup
    - Tailscale
    - Python environment setup
    - Zellij
    - Autofreq (laptop-specific)
    - Fusuma (laptop-specific)
    - Libinput (laptop-specific)
    - Gum (required)

- **Desktop Applications**:
    - Alacritty
    - Flameshot
    - GNOME Tweak Tool
    - VLC
    - Visual Studio Code
    - Zen Browser
    - Ulauncher
    - Obsidian (optional)
    - OBS Studio (optional)
    - Spotify (optional)
    - Zotero (optional)

- **Desktop Configurations**:
    - Flatpak setup
    - Default terminal set to Alacritty
    - GNOME App Grid customization
    - Dock settings
    - GNOME Extensions
    - GNOME Hotkeys
    - GNOME Settings
    - GNOME Theme
    - Fonts installation

## License

Omakub is released under the [MIT License](https://opensource.org/licenses/MIT).