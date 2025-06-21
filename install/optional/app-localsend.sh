if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed localsend-bin
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  cd /tmp
  LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
  sudo apt install -y ./localsend.deb
  rm localsend.deb
  cd -
fi
