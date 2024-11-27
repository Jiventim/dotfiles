#!/bin/zsh

#symlinks

# wezterm
ln -sf ~/.dotfiles/.wezterm.lua ~/.wezterm.lua

# neovim
ln -sf ~/.dotfiles/nvim ~/.config/nvim

#zsh
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/custom-theme ~/.oh-my-zsh/themes/custom.zsh-theme
ln -sf ~/.dotfiles/zsh/aliases ~/.oh-my-zsh/custom/aliases.zsh
chmod +x ~/.oh-my-zsh/custom/aliases.zsh
