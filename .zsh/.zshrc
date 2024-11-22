source ~/.zsh/.prompt
source ~/.zsh/.functions
source ~/.zsh/.aliases
source ~/.zsh/.zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completion
autoload -U compinit
compinit

# autosuggestions and syntax highlighting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'

#vi keybindings
bindkey -v

# History settings
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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
