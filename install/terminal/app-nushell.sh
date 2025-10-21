if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed nushell carapace-bin
  cargo install --git https://github.com/nushell/nufmt
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  # Nushell
  curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
  sudo tee /etc/apt/sources.list.d/fury.list <<EOF
deb https://apt.fury.io/nushell/ /
deb [trusted=yes] https://apt.fury.io/rsteube/ /
EOF

  sudo apt update -y
  sudo apt install -y nushell carapace-bin
  cargo install --git https://github.com/nushell/nufmt
fi
