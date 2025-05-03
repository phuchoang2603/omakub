# Obsidian is a multi-platform note taking application. See https://obsidian.md

# Fetch latest Obsidian .deb URL
latest_url=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest |
  jq -r '.assets[] | select(.name | endswith("_amd64.deb")) | .browser_download_url')

# Download the .deb file
tmp_deb="/tmp/obsidian_latest.deb"
wget -O "$tmp_deb" "$latest_url"

# Install the package
sudo dpkg -i "$tmp_deb" || sudo apt install -f -y

# Clean up
rm "$tmp_deb"
