paru -S --needed vmware-keymaps vmware-workstation

sudo systemctl enable vmware-networks-configuration.service
sudo systemctl enable vmware-networks.service
sudo systemctl enable vmware-usbarbitrator.service

sudo modprobe -a vmw_vmci vmmon
