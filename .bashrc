#
# ~/.bashrc
#
#If URXVT launch zsh instead
if [[ "$TERM" == *rxvt* ]]; then
    exec zsh
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Broken PS1, bash does not size correctly.
#export PS1='\[\e[38;5;231m\e[48;5;1m\]\H → [\u]\[$(~/bin/buildps1.sh)\] '


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
source ~/.aliases
