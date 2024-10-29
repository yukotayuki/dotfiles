# --------------
# fzf関連の設定
# --------------

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

brew_fzf_shell="`brew --prefix`/Cellar/fzf/0.55.0/shell"
if [ -e $brew_fzf_shell ]; then
  source "$brew_fzf_shell/key-bindings.zsh"
  source "$brew_fzf_shell/completion.zsh"
fi

# 補完する際にfzfを使う（カンマで呼び出す）
source <(fzf --zsh)

source $ZHOMEDIR/configs/fzf_plugins/cd_git_repository.zsh
source $ZHOMEDIR/configs/fzf_plugins/open_git_repository_web.zsh
source $ZHOMEDIR/configs/fzf_plugins/switch_git_branch.zsh
source $ZHOMEDIR/configs/fzf_plugins/select_zsh_history.zsh
