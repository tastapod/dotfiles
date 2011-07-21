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
 
setopt prompt_subst
PS1='${vcs_info_msg_0_}%F{yellow}%m %1~ %%%F{white} '

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

if [[ -f ~/.gnomerc ]] source ~/.gnomerc
if [[ -f ~/.zshrc_local ]] source ~/.zshrc_local # Host-specific stuff

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESSCLOSE='/usr/bin/lesspipe %s %s'
export LESS='-R'
export GREPOPTIONS='--color=auto'

export LC_CTYPE='en_GB.UTF-8'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# History management
setopt histignorespace histignoredups
alias fg=' fg' # fg doesn't make it into the history - hooray!
alias fgfg=fg  # Weird - I often find myself typing this

path=( $HOME/bin $HOME/local/bin $HOME/Applications/*/current/bin(/) "$path[@]" )
manpath=( $HOME/local/share/man "$manpath[@]" )

# Sources live in src/{repo}/{owner}/{project}
# e.g. src/github/tastapod/dotfiles
gitdirs=( $(find $HOME/src -maxdepth 4 -follow -type d \( -name .git -print -o -name .svn -name .hg \) -prune ) )
cdpath=( . "${(u)gitdirs[@]%/*/.git}" ) # parents of working directories with duplicates removed
unset gitdirs

source /etc/zsh_command_not_found

# Uncomment to stop / being a wordchar
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Aliases
alias open=gnome-open
alias ls='ls --color=auto'
export GREP_OPTIONS=--color

# Keyboard layouts
aoeu() { setxkbmap us -option ctrl:nocaps; }
asdf() { setxkbmap us dvorak -option ctrl:nocaps; }
aaaa() { setxkbmap gb -option ctrl:nocaps; }
one() { xrandr --output HDMI1 --off; }
two() { xrandr --output HDMI1 --right-of LVDS1 --auto; }


bindkey  '\C-[[1;5D' backward-word
bindkey  '\C-[[1;5C' forward-word

set +o ignoreeof

# RVM - ruby version manager
[[ -s "/usr/local/lib/rvm" ]] && source "/usr/local/lib/rvm"
alias markdown=rdiscount

# Python
export PYTHONSTARTUP="$HOME/.pythonstartup"
fignore+=(.pyc .pyo)
VIRTUAL_ENV_DISABLE_PROMPT=1
[[ -f "$HOME/local/python/env/default/bin/activate" ]] && source "$HOME/local/python/env/default/bin/activate"

# Java
export JAVA_HOME=/usr/lib/jvm/java-6-sun
