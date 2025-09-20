# pairs with .zshrc
_PROFILE=false
if $_PROFILE; then
  PS4=$'%D{%H:%M:%S.%.} %N:%i> '
  #exec 3>&2 2>/tmp/zsh_profile.$$
  #print -l /tmp/zsh_profile.$$
  #setopt xtrace prompt_subst
  zmodload zsh/zprof
fi

# environment
export CLICOLOR=
export EDITOR=hx
export VISUAL=hx

# for zfunctions plugin
export ZFUNCDIR="${ZDOTDIR:-$HOME/.local/share/zsh}/functions"

# antidote updater plugin
export ANTIDOTE_PLUGIN_SOURCE_F="$HOME/.zsh_plugins.zsh"

# remove path duplicates
typeset -gU path fpath cdpath

# set the list of directories that zsh searches for commands.
path=(
  "$HOME"/{,s}bin(N)
  "$HOME"/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

# homebrew
whence brew >/dev/null && eval $(brew shellenv)

# Go
whence go >/dev/null && path+=( "$(go env GOPATH)"/bin )

# Hugo
export HUGO_CACHEDIR="$HOME/.local/cache/hugo"

# vi: set ft=zsh
