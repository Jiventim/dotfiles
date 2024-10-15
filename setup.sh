#!/bin/bash
#symlinks for nvim and bashrc
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.bashrc ~/.bashrc

# symlinks for Oh My Posh theme
ln -sf ~/dotfiles/oh-my-posh/powerlevel10k_lean.omp.json ~/.poshthemes/powerlevel10k_lean.omp.json

# Source .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
