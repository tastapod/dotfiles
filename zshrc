# For profiling - also uncomment `zprof` at end
# zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"

#DISABLE_UNTRACKED_FILES_DIRTY=true
#ENABLE_CORRECTION=true
HIST_STAMPS="yyyy-mm-dd"

: ${ZSH_THEME:=daveverwer}

plugins+=( brew golang rust )

# Load oh-my-zsh but don't alias ls=ls -G
DISABLE_LS_COLORS=true source $ZSH/oh-my-zsh.sh
alias ls='\ls -G'

# Use daveverwer prompt but with % or # at the end
PS1=$(echo "$PS1" | sed 's/ [^ ]* $/ %# /')

# User configuration
path+="$HOME/.local/bin"
cdpath=( "$HOME/Projects" )

# Make sure completions are working
autoload -Uz compinit
compinit

# For profiling, uncomment next line and line at top
# zprof
