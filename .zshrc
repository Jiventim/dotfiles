# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# completion
autoload -U compinit
compinit

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# autosuggestions and syntax highlighting :)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# prompt and theme
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.powerlevel10k/powerlevel10k.zsh-theme

#vi keybindings :)
bindkey -v

# History settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Export terminal and editor
export TERMINAL=wezterm
export EDITOR="nvim"
export LANG="en_US.UTF-8"


setopt autocd #cd into directory by typing its name :)

bindkey '?' autosuggest-accept #tab to accept autosuggestions

setopt sharehistory #share history between zsh sessions :)

setopt histignorealldups #Ignore duplicate command history

# better ls
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

# some more ls aliases
 alias ll='ls -alF'
 alias la='ls -A'
 alias l='ls -CF'

# Create a directory and then cd into it
mkcd() {
  mkdir $1 && cd $1
}

install() {
  sudo apt-get install $1 -y
}

remove() {
  sudo apt remove --purge $1 -y
}

# some more aliases
alias ls='eza --icons=always'
alias ..='cd ..'
alias ...='cd ../..'
alias nv='nvim'
alias update='sudo apt update && sudo apt upgrade -y'
alias g='git'
alias logout='loginctl terminate-session $XDG_SESSION_ID'
alias cat='bat'

#yazi
function y(){
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#-----------DASHBOARD-------------

#one time dashboard

# Path to the temporary file
DASHBOARD_SHOWN_FILE="/tmp/.dashboard_shown?"

if [ ! -f "$DASHBOARD_SHOWN_FILE" ]; then

  # Show today's date with figlet and lolcat
  date_str="$(date "+%A, %B %d, %Y")"

  # Get terminal width
  terminal_width=$(tput cols)

  # Use figlet to create the output
  figlet_output=$(echo "$date_str" | figlet)

  # Calculate the number of spaces needed to center each line
  while IFS= read -r line; do
    line_length=${#line}
    padding=$(( (terminal_width - line_length) / 2 ))
    printf "%*s\n" $padding "$line"
  done <<< "$figlet_output" | lolcat

  # Create the temporary file to indicate the dashboard has been shown
  touch "$DASHBOARD_SHOWN_FILE"
fi

#show dashboard again
dashboard(){
  rm /tmp/.dashboard_shown?
  source .zshrc
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

