zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

if [[ -f ~/.gnomerc ]] source ~/.gnomerc

# PS1='%n@%m:%~%# '

PS1='%{]0;%~
[35m%}%n@%m %{[33m%}%~%{[0m%}
%# '

export LESSOPEN='| /usr/bin/lesspipe %s'
export LESSCLOSE='/usr/bin/lesspipe %s %s'

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
alias aaaa='setxkbmap us -option ctrl:nocaps'
alias asdf='setxkbmap us dvorak -option ctrl:nocaps'
alias aoeu='setxkbmap us colemak -option ctrl:nocaps'
alias arst='setxkbmap us dvorak -option ctrl:nocaps'

bindkey  '\C-[[1;5D' backward-word
bindkey  '\C-[[1;5C' forward-word

set +o ignoreeof

# RVM - ruby version manager
[[ -s "/usr/local/lib/rvm" ]] && source "/usr/local/lib/rvm"
