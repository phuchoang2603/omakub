# https://github.com/ferstar/ideapad-laptop-tb
sudo apt install -y dkms

mkdir -p ~/repos/
git clone https://github.com/ferstar/ideapad-laptop-tb.git ~/repos/ideapad-laptop-tb
cd ~/repos/ideapad-laptop-tb


git reset --hard 45b1dc1
make sync-source apply-patch
sudo dkms add .
sudo dkms install ideapad-laptop-tb/6.10
sudo cp dkms/blacklist-ideapad-laptop-tb-dkms.conf /etc/modprobe.d/

cd -