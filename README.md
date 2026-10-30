# .dotfiles - An easy way to replicate my workstation
This repository contains my configs for a **Fedora 44 minimal with Niri and Noctalia**. It also works as a guide for the installation, with a brief explanation of all the settings.

## Set everything up
### OS installation. 
Use the [Fedora Everything ISO](https://fedoraproject.org/misc/#everything), which lets you install a custom minimal Fedora. The only section that matters for this guide is **Software selection**:
- **Base environment**: "Fedora Custom Operating System"
- **Additional software**: "Common NetworkManager Submodules" and "Standard"

Figure 1 shows how the selections from this menu look. The rest is a regular installation: timezone, keyboard, language, user, and disk partitioning. When the installation finishes, reboot and unplug the installer usb.

### First steps. 
You'll only have a console and very few programs. So log in from the TTY and clone this repo in your home directory

```
~/ $ sudo dnf install git -y
~/ $ git clone https://github.com/dasaczzz/.dotfiles.git
```

Move into `.dotfiles` and allow execution of `setup.sh` in your system. Finally run the script.

```
~/ $ cd .dotfiles
~/.dotfiles/ $ chmod +x ./setup.sh
~/.dotfiles/ $ ./setup.sh
```

Reboot, log in (I don't use a display manager; Niri starts straight from the console), and Noctalia, apps, keybinds, styles, etc... will be installed and working.

## What does the script do?
* Update packages
* Install these packages: zsh fastfetch niri noctalia yazi flatpak stow gh zed
* Add flathub repository.
* Download these apps: Zen browser, Spotify, Discord
* Setup zsh as the default shell and config directory 
* symlink all the config files in their corresponding default locations with GNU stow.
