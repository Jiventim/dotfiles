# bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export TERMINAL=wezterm
export VISUAL="nvim"
export EDITOR="nvim"

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
alias ls='eza --icons=always'
alias ..='cd ..'
alias ...='cd ../..'
alias nv='nvim'
alias update='sudo apt update && sudo apt upgrade -y'
alias g='git'
alias logout='loginctl terminate-session $XDG_SESSION_ID'

#yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

#-----------DASHBOARD-------------

# Path to the temporary file
DASHBOARD_SHOWN_FILE="/tmp/.dashboard_shown?"

if [ ! -f "$DASHBOARD_SHOWN_FILE" ]; then

  # Show today's date with figlet and lolcat
  date_str="$(date "+%A, %B %d, %Y")"

  # Check if figlet and lolcat are installed
  if ! command -v figlet &>/dev/null; then
    echo "figlet is not installed. Please install it."
    exit 1
  fi

  if ! command -v lolcat &>/dev/null; then
    echo "lolcat is not installed. Please install it."
    exit 1
  fi

  # Get terminal width
  terminal_width=$(tput cols)

  # Use figlet to create the output
  figlet_output=$(echo "$date_str" | figlet)

  # Calculate the number of spaces needed to center each line
  while IFS= read -r line; do
    line_length=${#line}
    padding=$(((terminal_width - line_length) / 2))
    printf "%*s\n" $padding "$line"
  done <<<"$figlet_output" | lolcat

  # Create the temporary file to indicate the dashboard has been shown
  touch "$DASHBOARD_SHOWN_FILE"
fi

#show dashboard again
dashboard() {
  rm /tmp/.dashboard_shown?
  source .bashrc
}
