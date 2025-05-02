# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
curl https://mise.run | sh
eval "$(mise activate bash)"

# Install default programming languages
AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "Python" "Elixir" "Rust" "Java")
languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --selected "Node.js" --selected "Python" --selected "Rust" --selected "Go" --no-limit --height 15 --header "Select programming languages - some are default")

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      mise use --global ruby@latest
      mise x ruby -- gem install rails --no-document
      ;;
    Node.js)
      mise use --global node@lts
      ;;
    Go)
      mise use --global go@latest
      ;;
    Python)
      mise use --global python@latest
      mise use --global uv@latest
      ;;
    Elixir)
      mise use --global erlang@latest
      mise use --global elixir@latest
      mise x elixir -- mix local.hex --force
      ;;
    Rust)
      bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
      . "$HOME/.cargo/env"
      ;;
    Java)
      mise use --global java@latest
      ;;
    esac
  done
fi
