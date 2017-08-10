#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'


export PS1='\[\e[38;5;231m\e[48;5;1m\]\H → [\u]\[$(~/bin/buildps1.sh)\] '

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
