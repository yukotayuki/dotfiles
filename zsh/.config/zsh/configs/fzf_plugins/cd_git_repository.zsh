function fzf-cd-git-repository() {
  local selected=`ghq list | sed 's/^[^ ][^ ]*  *//' | fzf`
  if [[ -n $selected ]]; then
    cd $REPODIR/$selected
  fi
  zle reset-prompt
}
zle -N fzf-cd-git-repository
bindkey '^Y' fzf-cd-git-repository