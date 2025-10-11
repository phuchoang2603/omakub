#!/usr/bin/env bash
set -euo pipefail

paru -Rdd $(pacman -Qsq "hypr|aqua")
PKG_DIR="$HOME/repos/pkgs"
RESTORE_FILE="$HOME/repos/pkgs/pkgs_restore.txt"
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

mkdir -p "$PKG_DIR"

record_installed_version() {
  local pkg="$1"
  local dir="$PKG_DIR/$pkg"
  if paru -Q "$pkg" &>/dev/null; then
    local version
    version=$(paru -Q "$pkg" | awk '{print $2}')
    echo "$pkg $version $dir" >>"$RESTORE_FILE"
  fi
}

fetch_pkgbuild() {
  local pkg="$1"
  local dir="$PKG_DIR/$pkg"
  mkdir -p "$dir"
  echo "Fetching PKGBUILD for $pkg..."
  curl -fsSL "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkg}" -o "$dir/PKGBUILD"
}

install_pkg() {
  local pkg="$1"
  local dir="$PKG_DIR/$pkg"
  echo "Building $pkg..."
  cd "$dir"
  makepkg -si --noconfirm --cleanbuild --skippgpcheck
  cd - >/dev/null
}

restore_pkgs() {
  echo "Restoring..."
  while IFS=" " read -r pkg version dir; do
    echo "Restoring $pkg=$version from $dir..."
    tarball=$(ls "$dir"/*.pkg.tar.* 2>/dev/null | grep "$pkg-$version" || true)
    if [[ -f "$tarball" ]]; then
      sudo paru -U --noconfirm "$tarball"
    else
      sudo paru -S --noconfirm "$pkg=$version"
    fi
  done <"$RESTORE_FILE"
}

if [[ "${1-}" == "restore" ]]; then
  restore_pkgs
  exit 0
fi

>"$RESTORE_FILE"

for pkg in "${PKG_LIST[@]}"; do
  record_installed_version "$pkg"
  fetch_pkgbuild "$pkg"
  install_pkg "$pkg"
done

echo "Done."
