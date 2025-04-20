# Fcitx5 is a popular input method for CJK input

sudo apt install -y fcitx5 fcitx5-gtk fcitx5-configtool fcitx5-unikey

export XMODIFIERS=@im=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5

# Copy configuration files
mkdir -p ~/.config/fcitx5
cp ~/.local/share/omakub/configs/fcitx5/* ~/.config/fcitx5/

# Start Fcitx5 on login
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/fcitx5.desktop ~/.config/autostart/fcitx5.desktop