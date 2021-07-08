export ZSH="$HOME/.oh-my-zsh"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

: ${ZSH_THEME:=kolo}
plugins=(git golang kubectl)
source $ZSH/oh-my-zsh.sh

# User configuration
path+="$HOME/.local/bin"
cdpath=( "$HOME/Projects" )
umask 002
