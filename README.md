# dotfiles
This repo is my config for my ubuntu setup. The tools this repo sets are:
- git user and alias
- zsh
- ssh key (for github)
- [nvim](https://neovim.io/)
- [neofetch](https://github.com/dylanaraps/neofetch) (session info)
- terminal font
---
## Steps to set up
### 1. Before clone
The only dependency you need to have before cloning the repo is git (obviously).
### 2. Grant permissions
To run the ``setup.sh`` bash file run the command: ``sudo chmod +x setup.sh`` to add execution permission to the bash file.
### 3. Run the setup.
execute the command ``./setup.sh`` to run all the instructions to setup the above tools.
### 4. Restart the session
finally, you only need to restart the user session and open again a terminal to view the installation and the new look of the terminal!

---
## Set up Github ssh key
To vinculate the device with Github u only need to: 
- Go to the .ssh folder (``cd ~/.ssh``)
- See and copy the content of the file id_rsa.pub (``cat id_rsa.pub``)
- Open github and go to: Settings > SSH and GPG keys > add new SSH key
- Paste the content and u got it!
