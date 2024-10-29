#!/bin/bash

#----some symlinks----

#wezterm
ln -sf ~/.dotfiles/.wezterm.lua ~/.wezterm.lua

#neovim
ln -sf ~/.dotfiles/nvim ~/.config/nvim

#bashrc and zshrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# Oh My Posh
mkdir -p ~/.poshthemes
ln -sf ~/dotfiles/powerlevel10k_lean.omp.json ~/.poshthemes/powerlevel10k_lean.omp.json
