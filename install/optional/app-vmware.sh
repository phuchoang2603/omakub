paru -S --needed vmware-keymaps vmware-workstation

sudo systemctl start vmware-networks-configuration.service
sudo systemctl start vmware-networks.service
sudo systemctl start vmware-usbarbitrator.service

sudo modprobe -a vmw_vmci vmmon
