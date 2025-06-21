# Fcitx5 is a popular input method for CJK input
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed fcitx5 fcitx5-config-qt fcitx5-unikey
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y fcitx5 fcitx5-config-qt fcitx5-unikey
fi

export XMODIFIERS=@im=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
