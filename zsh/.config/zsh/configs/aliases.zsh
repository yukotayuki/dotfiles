###################################################
#
#    alias & completions
#
###################################################

if [[ $(uname) == 'Darwin' ]]; then
    alias ls="ls -G"
    alias vim='nvim'
    source $ZHOMEDIR/configs/plugins/ssh.zsh
    alias ssh=ssh_change_profile
    compdef ssh_change_profile=ssh
else
    alias ls="ls --color"
    # alias ls="lsd"
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias tsource="tmux source"

alias g='git'
compdef g=git

function dc() {
    docker compose "$@"
}
compdef dc=docker-compose

source <(kubectl completion zsh)

if [[ $GIT_EDITOR == 'nvr' ]]; then
    alias vim = 'nvr'
fi
