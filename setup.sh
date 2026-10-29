#!/bin/bash
set -e

sudo dnf copr enable -y lihaohong/yazi
sudo dnf upgrade --refresh -y
sudo dnf install -y zsh fastfetch niri noctalia yazi flatpak stow

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# verify and declare (if needed) the existence of the zsh config dir env variable
ZDOTDIR_LINE='export ZDOTDIR="$HOME/.config/zsh"'

if ! grep -Fqx "$ZDOTDIR_LINE" /etc/zshenv 2>/dev/null; then
  echo "$ZDOTDIR_LINE" | sudo tee -a /etc/zshenv > /dev/null
fi	

stow .

chsh -s "$(command -v zsh)"
