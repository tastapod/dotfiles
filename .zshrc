function {
  # For profiling set to true
  local _profile=false

  $_profile && zmodload zsh/zprof

  source ${HOMEBREW_PREFIX:-/opt/homebrew}/opt/antidote/share/antidote/antidote.zsh

  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

  # (re)load local functions
  # autoload -Uz funcload && funcload

  # For profiling
  $_profile && zprof
  unset _profile

  # vim: set ft=bash
}
