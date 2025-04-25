if ! command -v zellij &>/dev/null; then
  cd /tmp
  wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
  tar -xf zellij.tar.gz zellij
  sudo install zellij /usr/local/bin
  rm zellij.tar.gz zellij
  cd -
else
  echo "Zellij is already installed."
fi

mkdir -p ~/.config/zellij/themes
[ -e ~/.config/zellij/config.kdl ] && rm ~/.config/zellij/config.kdl
ln -sf ~/.local/share/omakub/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/omakub/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
