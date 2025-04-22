# Omakub

Turn a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. That's the one-line pitch for Omakub. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best.

Watch the introduction video and read more at [omakub.org](https://omakub.org).

[![GitHub Introduction](https://img.youtube.com/vi/2WSktnoubMM/0.jpg)](https://youtu.be/2WSktnoubMM)

## Getting Started

To set up your system with Omakub, run the following command in your terminal:

```bash
git clone https://github.com/phuchoang2603/omakub.git ~/.local/share/omakub
source ~/.local/share/omakub/install.sh
```

This will download and execute the installation script, which will configure your system with all the tools and settings included in this repository.

## Applications and Tools

Below is a list of applications and tools included in Omakub, categorized by their purpose:

### Desktop
- **Alacritty**: A fast, GPU-accelerated terminal emulator.
- **Flameshot**: A powerful yet simple screenshot tool.
- **GNOME Sushi**: A quick previewer for files in GNOME.
- **GNOME Tweak Tool**: A tool to customize GNOME desktop settings.
- **VLC**: A versatile media player supporting various formats.
- **VS Code**: A popular code editor with extensive extensions.
- **Zen Browser**: A lightweight and privacy-focused web browser.
- **Ulauncher**: A fast application launcher for Linux.

### Laptop
- **AutoFreq**: Automatically adjusts CPU frequency for better performance and battery life.
- **Fix ThinkBook**: A script to fix specific issues on Lenovo ThinkBook laptops.
- **Fusuma**: A multitouch gesture recognizer.
- **Libinput**: A library to handle input devices in Linux.

### Optional
- **Filecxx**: A modern file manager.
- **LocalSend**: A tool for local file sharing.
- **OBS Studio**: Software for video recording and live streaming.
- **Obsidian**: A knowledge base and note-taking application.
- **Rclone**: A command-line program to manage cloud storage.
- **Spotify**: A music streaming application.
- **Tailscale**: A secure VPN service.
- **Zotero**: A reference management tool.
- **Dock Settings**: Customizes the GNOME dock appearance and behavior.

### Terminal
- **Gum**: A tool for building rich terminal UIs.
- **CopyQ**: An advanced clipboard manager.
- **Fastfetch**: A fast system information tool.
- **Fcitx5**: An input method framework.
- **GitHub CLI**: A command-line interface for GitHub.
- **Lazygit**: A simple terminal UI for Git.
- **Neovim**: A modernized version of Vim.
- **NextDNS**: A DNS service for privacy and security.
- **Zellij**: A terminal workspace and multiplexer.

### Utilities
- **Set Git**: Configures Git with user-specific settings.
- **Libraries**: Installs essential libraries for development.
- **GNOME Extensions**: Adds and configures GNOME desktop extensions.
- **GNOME Hotkeys**: Customizes keyboard shortcuts for GNOME.
- **GNOME Settings**: Applies system-wide GNOME settings.
- **GNOME Theme**: Installs and applies themes for GNOME.

These tools and scripts are designed to enhance your Linux experience and streamline your workflow.

Follow the interactive prompts to select and install the desired components.

## Omakub CLI Tool

Omakub also includes a powerful CLI tool that provides flexibility for users who want to customize their setup further or add additional components after the initial installation.

- **Theme Installation**: Quickly apply beautiful themes to enhance your desktop environment.
- **Font Installation**: Install a variety of fonts to improve the look and feel of your system.

To use the CLI tool, simply run the following command:

```bash
omakub
```

## License

Omakub is released under the [MIT License](https://opensource.org/licenses/MIT).