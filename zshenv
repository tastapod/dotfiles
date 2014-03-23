# prompt
setopt prompt_subst
PS1='${vcs_info_msg_0_}%F{yellow}%m %1~ %%%F{white} '

# command tweaks
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESSCLOSE='/usr/bin/lesspipe %s %s'
export LESS='-R'
if [[ $(uname) == 'Linux' ]]; then
    export GREPOPTIONS='--color=auto'
    eval $(dircolors)
fi

export LC_CTYPE='en_GB.UTF-8'

# core path
[[ -d $HOME/Languages ]] && path=( $HOME/Languages/*/current/bin(/) "$path[@]" )
[[ -d $HOME/Applications ]] && path=( $HOME/Applications/*/current/bin(/) "$path[@]" )
path=( $HOME/bin "$path[@]" )

# sources live in src/{repo}/{owner}/{project} eg. src/github/tastapod/dotfiles
gitdirs=($HOME/src/*/*/*/.git)
#svndirs=($HOME/src/*/*/*/.svn)
repodirs=($HOME/src/*)
cdpath=( . "${(u)gitdirs[@]%/*/.git}" "${repodirs[@]}") # parents of working directories with duplicates removed
unset gitdirs

# ruby
[[ -n ${path[(r)*/.rbenv/bin]} ]] || path=( ~/.rbenv/bin ~/.rbenv/shims "${path[@]}")
rbenv rehash

# python
export PYTHONSTARTUP="$HOME/.pythonstartup"
fignore+=(.pyc .pyo)
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# go
which go >&- && export GOROOT=$(dirname $(dirname $(which go)))

# nodejs
export N_PREFIX=$HOME/.n
path+=("$N_PREFIX/bin")

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Host-specific stuff
if [[ -f ~/.gnomerc ]] source ~/.gnomerc
if [[ -f ~/.zshrc_local ]] source ~/.zshrc_local
