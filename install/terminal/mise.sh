# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
curl https://mise.jdx.dev/mise-latest-linux-x64 >~/.local/bin/mise
chmod +x ~/.local/bin/mise

eval "$(mise activate bash)"
