source ~/.local/share/omakub/install/terminal/libraries.sh
source ~/.local/share/omakub/install/terminal/mise.sh
source ~/.local/share/omakub/install/terminal/select-dev-language.sh

# Then run the rest, excluding those three
for installer in ~/.local/share/omakub/install/terminal/*.sh; do
  case "$installer" in
  *libraries.sh | *mise.sh | *select-dev-language.sh) continue ;; # skip
  *) source "$installer" ;;
  esac
done
