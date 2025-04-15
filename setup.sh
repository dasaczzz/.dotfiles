sudo apt update
sudo apt install -y git zsh curl neofetch

if  [ "$SHELL" != *zsh ]; then
	echo "changing the default shell to zsh"
	chsh -s $(which zsh)
fi

# link the repository files to the machine
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/neofetch/config.conf ~/.config/neofetch/config.conf

echo "files linked"

# download and unzip font folder
FONT_DIR="$HOME/.local/share/fonts"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
FONT_ZIP="/tmp/JetBrainsMono.zip"

mkdir -p "$FONT_DIR"
curl -L "$FONT_URL" -o "$FONT_ZIP"
unzip -o "$FONT_ZIP" -d "$FONT_DIR"

# update cache
if command -v fc-cache &> /dev/null; then
  fc-cache -fv "$FONT_DIR"
fi

echo "font donwloaded in system"
