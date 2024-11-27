source ~/.dotfiles/zsh/custom-theme
source ~/.dotfiles/zsh/functions
source ~/.dotfiles/zsh/aliases
source ~/.dotfiles/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
