if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed noto-fonts-cjk ttf-cascadia-mono-nerd
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y fonts-noto-cjk

  mkdir -p ~/.local/share/fonts

  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/*.ttf ~/.local/share/fonts
  rm -rf CascadiaMono.zip CascadiaFont

  fc-cache
  cd -

fi
