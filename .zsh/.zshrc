#oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
$ZSH_CUSTOM/aliases.zsh

#custom config
source ~/.dotfiles/.zsh/.functions

# completion
autoload -U compinit
compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'

#vi keybindings
bindkey -v

bindkey '?' autosuggest-accept

#history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export TERMINAL=wezterm
export EDITOR="nvim"
export LANG="en_US.UTF-8"

setopt autocd sharehistory histignorealldups

#yazi
function y(){
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
