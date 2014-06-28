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

# ruby
[[ -n ${path[(r)*/.rbenv/bin]} ]] || path=( ~/.rbenv/bin ~/.rbenv/shims "${path[@]}")
rbenv rehash

# python
export PYTHONSTARTUP="$HOME/.pythonstartup"
fignore+=(.pyc .pyo)
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# java
if [[ -x /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    PATH="$JAVA_HOME/bin:$PATH"
fi

# go
if whence -p go >/dev/null; then
    eval $(go env | egrep '^(GOROOT|GOTOOLDIR)')
    export GOROOT GOPATH=$HOME/Workspaces/Go/general
    PATH="$GOPATH/bin:$PATH"
fi

# nodejs
export N_PREFIX=$HOME/.n
path+=("$N_PREFIX/bin")

# Mac
export CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments

# sources live in Projects/{host}/{owner}/{project} eg. Projects/github.com/tastapod/dotfiles
gitdirs=($HOME/Projects/*/*/*/.git)
[[ -n "$GOPATH" ]] && gitdirs+=($GOPATH/src/*/*/*/.git)
#svndirs=($HOME/Projects/*/*/*/.svn)
cdpath=( . "${(u)gitdirs[@]%/*/.git}" ) # parents of working directories with duplicates removed
unset gitdirs workspaces

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Host-specific stuff
if [[ -f ~/.gnomerc ]] source ~/.gnomerc
if [[ -f ~/.zshrc_local ]] source ~/.zshrc_local
