# Zotero is a free and open-source reference management software to manage bibliographic data and related research materials.
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed zotero-bin
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
  sudo apt update
  sudo apt install -y zotero
fi
