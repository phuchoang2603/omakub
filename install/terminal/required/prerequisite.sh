# Needed for all installer
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip
sudo apt install -y \
  autoconf bison build-essential clang pkg-config \
  libffi-dev libgdbm-dev libjemalloc2 libncurses5-dev libreadline-dev libssl-dev libyaml-dev zlib1g-dev \
  gir1.2-clutter-1.0 gir1.2-gtop-2.0 \
  libmysqlclient-dev libpq-dev libsqlite3-0 postgresql-client postgresql-client-common redis-tools sqlite3 \
  ffmpeg imagemagick libmagickwand-dev libvips mupdf mupdf-tools poppler-utils \
  7zip apache2-utils bat btop eza fd-find fzf jq plocate ripgrep tldr zoxide \
  pipx python3-pip

if ! command -v bat &>/dev/null; then
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi

if ! command -v fd &>/dev/null; then
  mkdir -p ~/.local/bin
  ln -s "$(which fdfind)" ~/.local/bin/fd
fi
