paru -S sbctl sbsigntools
sudo -i
sbctl create-keys
sbctl enroll-keys --microsoft

sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sbctl verify | sed 's/✗ /sbctl sign -s /e'
sbctl status
