if [ "$OMAKUB_OS_ID" == "arch" ]; then
  # Nushell & carapace-bin
  paru -S --noconfirm --needed nushell carapace-bin
  # Nufmt
  cargo install --git https://github.com/nushell/nufmt
  # Bash-env plugin
  wget -O ~/.local/bin/bash-env-json "https://raw.githubusercontent.com/tesujimath/bash-env-json/main/bash-env-json" && chmod +x ~/.local/bin/bash-env-json
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  # Nushell & carapace-bin
  curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
  sudo tee /etc/apt/sources.list.d/fury.list <<EOF
deb https://apt.fury.io/nushell/ /
deb [trusted=yes] https://apt.fury.io/rsteube/ /
EOF

  sudo apt update -y
  sudo apt install -y nushell carapace-bin
  # Nufmt
  cargo install --git https://github.com/nushell/nufmt
  # Bash-env plugin
  wget -O ~/.local/bin/bash-env-json "https://raw.githubusercontent.com/tesujimath/bash-env-json/main/bash-env-json" && chmod +x ~/.local/bin/bash-env-json
fi
