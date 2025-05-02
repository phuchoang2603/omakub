paru -S --noconfirm --needed ulauncher

# Install extension dependencies
# for media-player-control
paru -S --noconfirm --needed playerctl
# for calculate-anything
pip3 install Pint simpleeval parsedatetime pytz babel --break-system-packages
# for vscode-recent
pip3 install fuzzywuzzy --break-system-packages
