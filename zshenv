# environment
export LC_CTYPE='en_GB.UTF-8'
export CLICOLOR=1
export EDITOR=${EDITOR:-vim}
#export GREP_OPTIONS='--color=auto'
# [ -n "$SSH_AUTH_SOCK" ] && [ "$SSH_AUTH_SOCK"!="$HOME/.ssh/screen-auth-sock" ] && ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/screen-auth-sock"
[ -n "$WSL_AUTH_SOCK" ] && export SSH_AUTH_SOCK="$WSL_AUTH_SOCK"
