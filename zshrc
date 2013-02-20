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

# History management
setopt histignorespace histignoredups
alias fg=' fg' # fg doesn't make it into the history - hooray!
alias fgfg=fg  # Weird - I often find myself typing this

source /etc/zsh_command_not_found

# Uncomment to stop / being a wordchar
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Aliases
alias open=xdg-open
alias ls='ls --color=auto'
export GREP_OPTIONS=--color

# Keyboard layouts
aoeu() { setxkbmap us -option ctrl:nocaps; }
asdf() { setxkbmap us dvorak -option ctrl:nocaps; }
aaaa() { setxkbmap gb -option ctrl:nocaps; }
one() { xrandr --output HDMI1 --off; }
two() { xrandr --output HDMI1 --right-of LVDS1 --auto; }
vimwiki() { vim +bd +VimwikiUISelect; }


bindkey  '\C-[[1;5D' backward-word
bindkey  '\C-[[1;5C' forward-word

set +o ignoreeof

