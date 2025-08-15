function {
  # For profiling set to true
  local _profile=false

  $_profile && zmodload zsh/zprof

  [[ -d ~/.config/antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.config/antidote

  source ~/.config/antidote/antidote.zsh

  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

  # Ignore case for completions
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

  # overrides
  hx() { command hx --config ~/.helix.toml "$@" }

  # For profiling
  $_profile && zprof
  unset _profile

  # vim: set ft=bash
}
