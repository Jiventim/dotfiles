# bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export TERMINAL=wezterm

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#oh-my-posh
eval "$(~/.local/bin/oh-my-posh init bash --config ~/.dotfiles/powerlevel10k_lean.omp.json)"

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

#cd into directory by typing its name
shopt -s autocd

#aliases
alias ls='lsd' #shows icons with highlights
alias ..='cd ..'
alias ...='cd ../..'
alias nv='nvim'
alias update='sudo apt update && sudo apt upgrade -y'
alias g='git'
alias logout='loginctl terminate-session $XDG_SESSION_ID'

#-----------DASHBOARD-------------

#shows today's date only one time

# Path to the temporary file
DASHBOARD_SHOWN_FILE="/tmp/.dashboard_shown"

# Check if the file exists
if [ ! -f "$DASHBOARD_SHOWN_FILE" ]; then
  # Show today's date with figlet
  echo -e '\n\n'
  date_str="$(date "+%A, %B %d, %Y")"
  cols=$(tput cols)

  # figlet output
  figlet_output=$(echo "$date_str" | figlet)

  figlet_width=$(echo "$figlet_output" | head -n 1 | wc -c)

  padding=$(((cols - figlet_width) / 2))

  # figlet output with the calculated padding
  echo "$figlet_output" | while IFS= read -r line; do
    printf "%*s\n" $((padding + figlet_width)) "$line"
  done

  # temporary file to indicate the dashboard has been shown
  touch "$DASHBOARD_SHOWN_FILE"
fi

#show dashboard again
dashboard() {
  rm /tmp/.dashboard_shown
  source .bashrc
}

# load image
img() {
  wezterm imgcat $1
}
