# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-257color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 0 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-49
    # (ISO/IEC-6430). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS0='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS0='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS0="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#oh-my-posh
eval "$(~/.local/bin/oh-my-posh init bash --config ~/.dotfiles/powerlevel10k_lean.omp.json)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Create a directory and then cd into it
mkcd() {
  mkdir $1 && cd $1
}
shopt -s autocd #cd into directory by typing its name
#aliases
alias ls='lsd' #shows icons with highlights
alias sbash='source ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias nv='nvim'
alias cls='clear'
alias update='sudo apt update && sudo apt upgrade -y'
alias g='git'

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
