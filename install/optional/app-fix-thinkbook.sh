# Fix kernels https://github.com/ferstar/ideapad-laptop-tb
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed ideapad-laptop-tb-dkms
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y dkms

  mkdir -p ~/repos/
  git clone https://github.com/ferstar/ideapad-laptop-tb.git ~/repos/ideapad-laptop-tb
  cd ~/repos/ideapad-laptop-tb || return 1

  git reset --hard 45b1dc1
  make sync-source apply-patch
  sudo dkms add .
  sudo dkms install ideapad-laptop-tb/6.10
  sudo cp dkms/blacklist-ideapad-laptop-tb-dkms.conf /etc/modprobe.d/

  cd - || return 1

fi
