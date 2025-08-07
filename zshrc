# For profiling set to true
local _profile=false

$_profile && zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"

HIST_STAMPS="yyyy-mm-dd"

: ${ZSH_THEME:=daveverwer}

plugins=( brew direnv )

source $ZSH/oh-my-zsh.sh

# (re)load local functions
autoload -Uz funcload && funcload

# For profiling
$_profile && zprof
unset _profile

# vim: set ft=bash
