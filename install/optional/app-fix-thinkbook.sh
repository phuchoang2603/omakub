# Enable Lenovo Conservation mode
echo 1 | sudo tee /sys/bus/platform/devices/VPC2004:00/conservation_mode

# Fix kernels
# https://github.com/ferstar/ideapad-laptop-tb
paru -S --noconfirm --needed ideapad-laptop-tb-dkms
