# Agent Guidelines for Omakub

## Project Overview
Omakub is an Arch Linux system configuration tool that automates the setup of desktop and terminal environments. The codebase consists primarily of Bash shell scripts organized into modular installers.

## Testing & Running
- **Run main installer**: `source ~/.local/share/omakub/install.sh`
- **Run single installer**: `source ~/.local/share/omakub/install/desktop/app-kitty.sh`
- **Test individual scripts**: Execute directly with `bash <script-path>` or source them
- **No formal test suite**: Manual testing required; verify scripts work on target systems

## Code Style Guidelines
- **Shebang**: Use `#!/bin/bash` or `#!/usr/bin/env bash` for all executable scripts
- **Error handling**: Use `set -e` in scripts where appropriate to exit on errors
- **Variables**: Use `${VARIABLE}` syntax for variable expansion; define environment vars at top
- **Conditionals**: Follow pattern: `if [ "$VAR" == "value" ]; then ... fi`
- **Functions**: Define with `function_name() { ... }` syntax
- **Comments**: Use `#` for inline comments; provide context for non-obvious commands
- **File organization**: Group related installers in subdirectories (desktop/, terminal/, optional/)
- **Naming**: Use lowercase with hyphens for scripts (e.g., `app-docker.sh`, `rofi-session`)
- **Sourcing**: Use `source` for loading config scripts, not direct execution
- **Dependencies**: Check OS type with `$OMAKUB_OS_ID` for Arch/Ubuntu compatibility
- **Logging**: Main install logs to `~/.local/share/omakub/install.log`
