# make sure antidote is installed
local _a="$HOME/.config/antidote"
[[ -d "$_a" ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git "$_a"
source "$_a/antidote.zsh"
unset _a

zstyle ':antidote:bundle' use-friendly-names yes
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# pairs with .zshenv
if $_PROFILE; then
  # unsetopt xtrace
  zprof
fi
unset _PROFILE

# vim: set ft=zsh
