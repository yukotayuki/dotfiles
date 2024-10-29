if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZHOMEDIR/zinit_plugins.zsh

# autoload - compinitの前に設定しないと有効にならない
# zsh-completions
if [[ $(uname) == 'Darwin' ]]; then
    # mac
    fpath=( /opt/homebrew/share/zsh-completions "${fpath[@]}" )
else
    # linux
fi

# add custom completions
fpath=(~/.zsh/completion $fpath)
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz colors && colors
autoload -Uz compinit && compinit

# autoload - compinitの後に設定しないと有効にならない
## kubectlの補完
source <(kubectl completion zsh)
# direnvの補完 - autoloadの前に設定しても問題ない
eval "$(direnv hook zsh)"
# devboxの補完
eval "$(devbox completion zsh)"
# limactlの補完
eval "$(limactl completion zsh)"

# emacsモード
bindkey -e

source $ZHOMEDIR/configs/1_setopt.zsh
source $ZHOMEDIR/configs/2_env.zsh
source $ZHOMEDIR/configs/3_zstyle.zsh
source $ZHOMEDIR/configs/4_cdr.zsh
source $ZHOMEDIR/configs/5_fzf.zsh
source $ZHOMEDIR/configs/6_prompt.zsh
source $ZHOMEDIR/configs/7_aliases.zsh
source $ZHOMEDIR/configs/app_configs/asdf.zsh

# flatpak for nixos
if [[ $DISTRI == 'nixos' ]]; then
    source /run/current-system/sw/etc/profile.d/flatpak.sh
fi
