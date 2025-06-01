#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y zsh curl lf neovim neofetch stow build-essential nodejs npm

# install oh-my-posh for the prompt
export PATH=/home/dasaczzz/.local/bin:$PATH
curl -s https://ohmyposh.dev/install.sh | bash -s

# change the default shell to zsh
if  [[ "$SHELL" != *zsh ]]; then
	echo "changing the default shell to zsh"
	curl -s https://ohmyposh.dev/install.sh | bash -s
	chsh -s $(which zsh)
fi

# setting ssh key
if [ ! -f "$SSH_KEY" ]; then
  SSH_KEY="$HOME/.ssh/id_rsa"	
  ssh-keygen -t ed25519 -C "118865516+dasaczzz@users.noreply.github.com" -f "$SSH_KEY"
fi

# manage symbolic links with gnu stow
stow git
stow neofetch
stow nvim
stow zsh
stow ssh
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
