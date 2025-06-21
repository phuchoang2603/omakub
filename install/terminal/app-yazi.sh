if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed yazi
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  git clone https://github.com/sxyazi/yazi.git ~/repos/yazi

  cd ~/repos/yazi || return 1
  cargo build --release --locked
  sudo mv target/release/yazi target/release/ya /usr/local/bin/
  cd - || return 1

  # Remove yazi repo
  rm -rf ~/repos/yazi
fi
