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
        zstyle ':vcs_info:*' formats ' %F{yellow}[%F{green}%s:%b%c%u%F{yellow}]'
    } else {
        zstyle ':vcs_info:*' formats ' %F{yellow}[%F{green}%s:%b%c%u%F{red}●%F{yellow}]'
    }
    vcs_info
}
 
setopt prompt_subst
readonly PS1='%F{yellow}%m${vcs_info_msg_0_} %F{yellow}%1~%F{yellow} %%%F{white} '

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

if [[ -f ~/.gnomerc ]] source ~/.gnomerc
if [[ -f ~/.zsh_local ]] source ~/.zsh_local # Machine-specific stuff

export LESSOPEN='| /usr/bin/lesspipe %s'
export LESSCLOSE='/usr/bin/lesspipe %s %s'
export LESS='-R'
export GREPOPTIONS='--color=auto'

export LC_CTYPE='en_GB.UTF-8'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
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

PATH="$HOME/bin:$HOME/local/bin:$PATH"
MANPATH="$HOME/local/share/man:$MANPATH"

# Sources live in src/{repo}/{owner}/{project}
# e.g. src/github/tastapod/dotfiles
CDPATH="."
for d ( ~/src/*/*(/) ) { CDPATH="$CDPATH:$d" }

source /etc/zsh_command_not_found

# Uncomment to stop / being a wordchar
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Aliases
alias open=gnome-open
alias ls='ls --color=auto'

# Keyboard layouts
alias aoeu='setxkbmap us -option ctrl:nocaps'
alias asdf='setxkbmap us dvorak -option ctrl:nocaps'
alias aaaa='setxkbmap gb -option ctrl:nocaps'

bindkey  '\C-[[1;5D' backward-word
bindkey  '\C-[[1;5C' forward-word

set +o ignoreeof

# RVM - ruby version manager
[[ -s "/usr/local/lib/rvm" ]] && source "/usr/local/lib/rvm"

# Python
export PYTHONSTARTUP="$HOME/.pythonstartup"
fignore+=(.pyc .pyo)
[[ -f "$HOME/local/python/env/default/bin/activate" ]] && source "$HOME/local/python/env/default/bin/activate" 2>&-
