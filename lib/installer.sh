#!/bin/bash

# Global error tracking
INSTALL_ERRORS=()

# Check if a command exists
has() {
  command -v "$1" &>/dev/null
}

# Install package(s) via paru if not already installed
pkg() {
  local packages=("$@")
  paru -S --noconfirm --needed "${packages[@]}" 2>&1 || {
    INSTALL_ERRORS+=("Failed to install: ${packages[*]}")
    return 1
  }
}

# Install package only if command doesn't exist
install_if_missing() {
  local cmd="$1"
  shift
  local packages=("$@")
  
  if has "$cmd"; then
    echo "✓ $cmd already installed"
  else
    echo "→ Installing $cmd..."
    pkg "${packages[@]}" || return 1
  fi
}

# Report errors at the end
report_errors() {
  if [ ${#INSTALL_ERRORS[@]} -gt 0 ]; then
    echo ""
    echo "⚠️  Installation completed with errors:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    for error in "${INSTALL_ERRORS[@]}"; do
      echo "  ❌ $error"
    done
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    return 1
  else
    echo "✅ All installations completed successfully!"
    return 0
  fi
}
