function {
  # For profiling set to true
  local _profile=false

  $_profile && zmodload zsh/zprof

  [[ -d .config/antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git .config/antidote

  source .config/antidote/antidote.zsh

  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

  # (re)load local functions
  autoload -Uz funcload && funcload

  # overrides
  hx() { command hx --config "$HOME/.helix.toml" "$@" }

  # For profiling
  $_profile && zprof
  unset _profile

  # vim: set ft=bash
}
