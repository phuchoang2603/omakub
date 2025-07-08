if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --needed vmware-keymaps vmware-workstation

  sudo systemctl start vmware-networks-configuration.service
  sudo systemctl start vmware-networks.service
  sudo systemctl start vmware-usbarbitrator.service

  sudo modprobe -a vmw_vmci vmmon
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  true
fi
