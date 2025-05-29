# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

echo "Enter git identification..."
SYSTEM_NAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)
GIT_NAME=$(gum input --placeholder "Enter full name" --value "$SYSTEM_NAME" --prompt "Name> ")
GIT_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
