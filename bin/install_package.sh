install_packages() {
  local packages=("$@") # Capture all arguments as an array of package names

  # Detect the operating system
  local OMAKUB_OS_ID="unknown"
  if [ -f "/etc/os-release" ]; then
    . /etc/os-release
    OMAKUB_OS_ID=$ID
  fi

  if [ "$OMAKUB_OS_ID" == "arch" ]; then
    echo "Detected Arch Linux. Installing packages using paru..."
    paru -S --noconfirm --needed "${packages[@]}"
  elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
    echo "Detected Ubuntu. Installing packages using apt..."
    sudo apt update
    sudo apt install -y "${packages[@]}"
  else
    echo "Unsupported OS: $OMAKUB_OS_ID. Cannot install packages automatically."
    return 1
  fi
}
