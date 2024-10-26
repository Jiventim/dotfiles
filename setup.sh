#!/bin/bash

#----some soft links----

#wezterm
ln -sf ~/.dotfiles/.wezterm.lua ~/.wezterm.lua

#neovim & bashrc
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.bashrc ~/.bashrc

# Oh My Posh
ln -sf ~/dotfiles/powerlevel10k_lean.omp.json ~/.poshthemes/powerlevel10k_lean.omp.json

# Source .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
