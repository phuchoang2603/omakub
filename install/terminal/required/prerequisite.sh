if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed \
    base-devel autoconf bison clang pkgconf meson \
    bash bash-completion tldr cronie man-db man-pages \
    ffmpeg jq poppler fd ripgrep fzf zoxide imagemagick bat powertop btop eza tree \
    python-pipx python-pip
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y \
    build-essential autoconf bison clang pkg-config meson tldr \
    libffi-dev libgdbm-dev libjemalloc2 libncurses5-dev libreadline-dev libssl-dev libyaml-dev zlib1g-dev \
    ffmpeg jq poppler-utils fd-find ripgrep zoxide imagemagick bat powertop btop eza tree \
    pipx python3-pip

  if ! command -v bat &>/dev/null; then
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
  fi

  if ! command -v fd &>/dev/null; then
    mkdir -p ~/.local/bin
    ln -s "$(which fdfind)" ~/.local/bin/fd
  fi

  FZF_DOWNLOAD_URL="https://github.com/junegunn/fzf/releases/download/v0.64.0/fzf-0.64.0-linux_amd64.tar.gz"
  FZF_TMUX_SCRIPT_URL="https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux"

  cd /tmp || return
  # Download and install fzf binary
  curl -Ls "${FZF_DOWNLOAD_URL}" -o "fzf.tar.gz"
  tar -xzf fzf.tar.gz
  sudo install fzf /usr/local/bin/fzf

  # Download and install fzf-tmux script
  curl -Ls "${FZF_TMUX_SCRIPT_URL}" -o "fzf-tmux"
  sudo install fzf-tmux /usr/local/bin/fzf-tmux
  sudo chmod +x /usr/local/bin/fzf-tmux
  cd - || return

  echo "fzf installation attempted from ${FZF_DOWNLOAD_URL}."
  /usr/local/bin/fzf --version
fi
