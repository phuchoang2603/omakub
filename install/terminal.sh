# Symbolic dotfiles
if [ ! -d "$HOME/repos/dotfiles" ]; then
  git clone https://github.com/phuchoang2603/dotfiles.git ~/repos/dotfiles
fi
source ~/repos/dotfiles/symlink.sh
source ~/.bashrc

source ~/.local/share/omakub/install/terminal/required/prerequisite.sh
source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omakub/install/terminal/required/set-git.sh >/dev/null

# Install languages
source ~/.local/share/omakub/install/terminal/required/select-dev-language.sh

for installer in ~/.local/share/omakub/install/terminal/*.sh; do
  source "$installer"
done
