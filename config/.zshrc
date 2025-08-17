function {
  local ad_dir="$HOME/.config/antidote"
  [[ -d "$ad_dir" ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git "$ad_dir"
  source "$ad_dir/antidote.zsh"
  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
}
# vim: set ft=zsh
