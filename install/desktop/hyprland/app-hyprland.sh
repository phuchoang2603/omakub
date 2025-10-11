#!/usr/bin/env bash
set -euo pipefail

sudo -v

paru -Rdd --noconfirm $(pacman -Qsq "hypr|aqua") || true

PKG_DIR="$HOME/repos/pkgs"
PKG_LIST=(
  hyprutils-git
  hyprgraphics-git
  hyprwayland-scanner-git
  hyprland-protocols-git
  hyprlang-git
  hyprcursor-git
  hyprland-qt-support-git
  hyprland-qtutils-git
  aquamarine-git
  hyprland-git
  hypridle-git
  hyprlock-git
  hyprpaper-git
  hyprpolkitagent-git
  hyprshot-git
  xdg-desktop-portal-hyprland-git
  hyprpicker-git
  hyprqt6engine-git
  hyprsunset-git
  hyprsysteminfo-git
)

# Array to hold the paths of the final built packages
BUILT_PACKAGES=()

mkdir -p "$PKG_DIR"

fetch_pkgbuild() {
  local pkg="$1"
  local dir="$PKG_DIR/$pkg"
  mkdir -p "$dir"
  echo "Fetching PKGBUILD for $pkg..."
  curl -fsSL "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkg}" -o "$dir/PKGBUILD"
}

build_pkg() {
  local pkg="$1"
  local dir="$PKG_DIR/$pkg"
  echo "Building $pkg..."
  cd "$dir"
  makepkg -s --noconfirm --cleanbuild --skippgpcheck
  local tarball
  tarball=$(find . -maxdepth 1 -name "*.pkg.tar.zst" -print -quit)
  if [[ -n "$tarball" ]]; then
    BUILT_PACKAGES+=("$dir/$tarball")
  else
    echo "Error: Could not find built package for $pkg in $dir" >&2
    exit 1
  fi
  cd - >/dev/null
}

for pkg in "${PKG_LIST[@]}"; do
  fetch_pkgbuild "$pkg"
  build_pkg "$pkg"
done

if [ ${#BUILT_PACKAGES[@]} -gt 0 ]; then
  echo "Installing all built packages..."
  sudo pacman -U --noconfirm "${BUILT_PACKAGES[@]}"
else
  echo "No packages were built, nothing to install."
fi

echo "Done."
