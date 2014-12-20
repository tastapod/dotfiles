# prompt
setopt prompt_subst
PS1='${vcs_info_msg_0_}%F{yellow}%m %1~ %%%F{white} '

# Git prompt highlighting from http://bit.ly/ej4ZS8
autoload -Uz vcs_info
autoload -Uz colors
colors
zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{red}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '%F{green}(%b%c%u%F{green})'
    } else {
        zstyle ':vcs_info:*' formats '%F{green}(%b%F{red}●%c%u%F{green})'
    }
    vcs_info
}

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# command tweaks
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESSCLOSE='/usr/bin/lesspipe %s %s'
export LESS='-R'
if [[ $(uname) == 'Linux' ]]; then
    export GREPOPTIONS='--color=auto'
    eval $(dircolors)
fi

# History management
setopt histignorespace histignoredups
alias fg=' fg' # fg doesn't make it into the history - hooray!
alias fgfg=fg  # Weird - I often find myself typing this
alias wiki='gvim +VimwikiIndex'
alias grep='grep --color=auto'

[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

# Uncomment to stop / being a wordchar
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

bindkey  '\C-[[1;5D' backward-word
bindkey  '\C-[[1;5C' forward-word

set +o ignoreeof

# None of these should have duplicate entries
set -U CDPATH FIGNORE MANPATH PATH

# core path
[[ -d ~/Languages ]] && path=( ~/Languages/*/current/bin(/) "$path[@]" )
[[ -d ~/Applications ]] && path=( ~/Applications/*/current/bin(/) "$path[@]" )
path=( $HOME/bin "$path[@]" )

# Easy cd access to projects
[[ -d ~/Projects ]] && cdpath=( . ~/Projects/*/* )

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ruby
if [[ -d ~/.rbenv ]]; then
    path=( ~/.rbenv/bin ~/.rbenv/shims "${path[@]}")
    rbenv rehash
fi

# python
fignore+=(.pyc .pyo)

[[ -e ~/.pythonstartup ]] && export PYTHONSTARTUP="$HOME/.pythonstartup"

if whence -p virtualenvwrapper.sh >&/dev/null; then
    # shims for virtualenvwrapper functions - can probably clean this up with eval
    lssitepackages() { source $(whence -p virtualenvwrapper.sh); lssitepackages "$@"; }
    mktmpenv() { source $(whence -p virtualenvwrapper.sh); mktmpenv "$@"; }
    mkvirtualenv() { source $(whence -p virtualenvwrapper.sh); mkvirtualenv "$@"; }
    rmvirtualenv() { source $(whence -p virtualenvwrapper.sh); rmvirtualenv "$@"; }
    showvirtualenv() { source $(whence -p virtualenvwrapper.sh); showvirtualenv "$@"; }
    workon() { source $(whence -p virtualenvwrapper.sh); workon "$@"; }
fi
#source $(whence -p virtualenvwrapper.sh || echo '/dev/null')

# go
if whence -p go >&/dev/null; then
    goroot=$(go env GOROOT)
    export GOPATH="$HOME/Workspaces/Go/general"
    path+=( "$GOPATH/bin" "$goroot/bin" $GOPATH/src/*/* )
    [[ -f "$goroot/misc/zsh/go" ]] && source "$goroot/misc/zsh/go"
    unset goroot
fi

# nodejs
if [[ -d $HOME/.n ]]; then
    export N_PREFIX=$HOME/.n
    path=("$N_PREFIX/bin" "${path[@]}")
fi

# Host-specific stuff
if [[ -f ~/.gnomerc ]] source ~/.gnomerc
if [[ -f ~/.zshrc_local ]] source ~/.zshrc_local
