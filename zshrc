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

# Use daveverwer prompt but with % at the end
PS1='%{$fg[red]%}%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %# '

# User configuration
path+="$HOME/.local/bin"
cdpath=( "$HOME/Projects" )
umask 002

# For profiling, uncomment next line and line at top
# zprof

