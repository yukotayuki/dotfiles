zstyle :compinstall filename '/Users/joo/.zshrc'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:default' menu select=1
# End of lines added by compinstall

# --------------
# anyframeの設定
# --------------
# anyframeで明示的にpecoを使用するように定義
zstyle ":anyframe:selector:" use peco
# C-zでcd履歴検索後移動
bindkey '^Z' anyframe-widget-cdr
# C-rでコマンド履歴検索後実行
bindkey '^R' anyframe-widget-put-history

# --------------
# cdr関連の設定
# --------------
DIRSTACKSIZE=100 # スタックサイズ
# cdr, add-zsh-hook を有効にする
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs



# --------------------
# hyper-tab-iconの設定 
# --------------------

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
precmd() {
   if overridden; then return; fi
   cwd=${$(pwd)##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
