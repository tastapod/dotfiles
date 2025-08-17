function {
  # Ignore case for completions
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
  zstyle ':completion:*' menu select

  # aliases
  hx() { command hx --config ~/.helix.toml "$@" }
}
# vim: set ft=zsh
