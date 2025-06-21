if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed \
    base-devel autoconf bison clang pkgconf meson \
    bash bash-completion tldr cronie man-db man-pages \
    ffmpeg jq poppler fd ripgrep fzf zoxide imagemagick bat btop eza \
    python-pipx python-pip
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y \
    build-essential autoconf bison clang pkg-config meson tldr \
    libffi-dev libgdbm-dev libjemalloc2 libncurses5-dev libreadline-dev libssl-dev libyaml-dev zlib1g-dev \
    ffmpeg jq poppler-utils fd-find ripgrep fzf zoxide imagemagick bat btop eza \
    pipx python3-pip

  if ! command -v bat &>/dev/null; then
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
  fi

  if ! command -v fd &>/dev/null; then
    mkdir -p ~/.local/bin
    ln -s "$(which fdfind)" ~/.local/bin/fd
  fi
fi
