#!/bin/bash

# better error handling. e=exit if smt fail, u=no empty envs, o pipefail=any link of a pipe could throw an error
set -euo pipefail

# always run the script in the .dotfiles directory
cd "$(dirname "$(readlink -f "$0")")"

sudo dnf copr enable -y lihaohong/yazi
sudo dnf upgrade --refresh -y
sudo dnf install -y zsh fastfetch niri noctalia yazi flatpak stow gh

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install apps: zed editor, zen browser, spotify and discord
flatpak install -y --noninteractive flathub \
  app.zen_browser.zen \
  com.spotify.Client \
  com.discordapp.Discord

if [[ ! -x "$HOME/.local/bin/zed" ]]; then
  curl -f https://zed.dev/install.sh | sh
fi

# verify and declare (if needed) the existence of the zsh config dir env variable
ZDOTDIR_LINE='export ZDOTDIR="$HOME/.config/zsh"'

if ! grep -Fqx "$ZDOTDIR_LINE" /etc/zshenv 2>/dev/null; then
  echo "$ZDOTDIR_LINE" | sudo tee -a /etc/zshenv > /dev/null
fi

stow --no-folding .

chsh -s "$(command -v zsh)"
