###################################################
#
#    alias & completions
#
###################################################

if [[ $(uname) == 'Darwin' ]]; then
    alias ls="ls -G --color"
    alias vim='nvim'
    source $ZHOMEDIR/functions/ssh.zsh
    source $ZHOMEDIR/functions/gssh.zsh
    alias ssh=ssh_change_profile
    compdef ssh_change_profile=ssh
else
    alias ls="ls --color"
    # alias ls="lsd"
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

# alias ltservers=`$(ghq root)/github.com/skyway-internal/rtc-ops-scripts/listTargetServers/listTargetServers.sh`

alias tsource="tmux source"

alias g='git'
compdef g=git

# docker-composeの補完をdocker composeで有効にする
function dc() {
    docker compose "$@"
}
compdef dc=docker-compose

# source <(kubectl completion zsh)

if [[ $GIT_EDITOR == 'nvr' ]]; then
    alias vim = 'nvr'
fi

# エイリアスを設定
if (( $+commands[arch] )); then
  alias x64='exec arch -arch x86_64 "$SHELL"'
  alias a64='exec arch -arch arm64e "$SHELL"'
fi