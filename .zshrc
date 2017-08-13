# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BE'
#3 digit color code
#POWERLEVEL9K_DIR_FOREGROUND=''
#POWERLEVEL9K_DIR_BACKGROUND=''
#POWERLEVEL9K_DIR_PATH_SEPARATOR='\uE0B1'

#POWERLEVEL9K_CONTEXT_FOREGROUND=''
#POWERLEVEL9K_CONTEXT_BACKGROUND=''

#POWERLEVEL9K_VCS_FOREGROUND=''
#POWERLEVEL9K_VCS_BACKGROUND=''
autoload -Uz compinit
setopt COMPLETE_ALIASES
compinit -d .config/zsh/.zcompdump
ttyctl -f
zstyle ':completion:*' rehash

source ~/.aliases
source ~/bin/powerlevel9k/powerlevel9k.zsh-theme

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export term="xterm-256color"
