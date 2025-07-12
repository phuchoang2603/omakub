# Install libvirt and qemu things.
paru -S --noconfirm --needed libvirt virt-viewer qemu-full qemu-common virt-manager dnsmasq
# Add yourself to the libvirt group.
sudo usermod -a -G libvirt $USER
# Enable and start libvirtd.
systemctl enable --now libvirtd
sudo virsh net-autostart default
