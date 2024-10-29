function fzf-open-git-remote() {
  local selected=`ghq list | sed 's/^[^ ][^ ]*  *//' | fzf`
  if [[ -n $selected ]]; then
    if [[ -x "`which open`" ]]; then
      BUFFER="open https://${selected}"
    else
      BUFFER="xdg-open https://${selected}"
    fi
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-open-git-remote
bindkey '^O' fzf-open-git-remote