# Theming + App Support
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  packages=(
    libadwaita
    kvantum-qt5
    qt5-wayland
    qt6-wayland
    qt5ct
    qt6ct
    gnome-themes-extra
    gtk-engine-murrine
    sassc
  )

  paru -S --noconfirm --needed "${packages[@]}"
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  packages=(
    libadwaita-1-0    # Ubuntu package name for libadwaita
    qt5-style-kvantum # Ubuntu package name for kvantum-qt5
    qtwayland5        # Ubuntu package name for qt5-wayland
    qt6-wayland       # This seems to be the same on Ubuntu
    qt5ct
    qt6ct
    gnome-themes-extra
    gtk2-engines-murrine # Ubuntu package name for gtk-engine-murrine
    sassc
  )

  sudo apt-get install -y "${packages[@]}"
fi

wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.icons" sh
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh

git clone https://github.com/vinceliuice/Graphite-gtk-theme.git --depth 1 ~/repos/Graphite-gtk-theme
~/repos/Graphite-gtk-theme/install.sh -d $HOME/.themes -t -c dark -s standard -l --tweaks black rimless normal
