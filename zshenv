if [[ -f ~/.gnomerc ]] source ~/.gnomerc
if [[ -f ~/.zshrc_local ]] source ~/.zshrc_local # Host-specific stuff

# prompt
setopt prompt_subst
PS1='${vcs_info_msg_0_}%F{yellow}%m %1~ %%%F{white} '

# command tweaks
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESSCLOSE='/usr/bin/lesspipe %s %s'
export LESS='-R'
export GREPOPTIONS='--color=auto'
eval $(dircolors)

export LC_CTYPE='en_GB.UTF-8'

# core path
path=( $HOME/bin $HOME/local/bin $HOME/Applications/*/current/bin(/) "$path[@]" )
manpath=( $HOME/local/share/man "$manpath[@]" )

# sources live in src/{repo}/{owner}/{project} eg. src/github/tastapod/dotfiles
gitdirs=($HOME/src/*/*/*/.git)
svndirs=($HOME/src/*/*/*/.svn)
repodirs=($HOME/src/*)
cdpath=( . "${(u)gitdirs[@]%/*/.git}" "${(u)svndirs[@]%/*/.svn}" "${repodirs[@]}") # parents of working directories with duplicates removed
unset gitdirs

# ruby
[[ -n ${path[(r)*/.rbenv/bin]} ]] || path=( ~/.rbenv/bin ~/.rbenv/shims "${path[@]}")
rbenv rehash

# python
export PYTHONSTARTUP="$HOME/.pythonstartup"
export VIRTUAL_ENV_DISABLE_PROMPT=yes
fignore+=(.pyc .pyo)
[[ -d ~/local/python/default ]] && source ~/local/python/default/bin/activate

# node.js
[[ -f ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh
