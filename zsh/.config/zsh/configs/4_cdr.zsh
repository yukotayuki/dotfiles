# --------------
# hook関数の登録
# --------------

## cdr, add-zsh-hook の有効化
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-default true