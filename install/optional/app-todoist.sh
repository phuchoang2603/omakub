paru -S --noconfirm --needed todoist-appimage

# Todist CLI
git clone https://github.com/sachaos/todoist.git ~/repos/todoist
cd ~/repos/todoist || exit
make install
cd - || exit
