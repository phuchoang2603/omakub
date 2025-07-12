# Theming + App Support
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

if [ ! -d ~/repos/Graphite-gtk-theme ]; then
  wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.icons" sh
  wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
  git clone https://github.com/vinceliuice/Graphite-gtk-theme.git --depth 1 ~/repos/Graphite-gtk-theme
else
  echo "graphite theme and papirus already installed"
fi

~/repos/Graphite-gtk-theme/install.sh -d $HOME/.themes -t -c dark -s standard -l --tweaks black rimless normal
