# 関数
function git-prompt {
  local branchname
  branchname=`git symbolic-ref --short HEAD 2> /dev/null`
  if [ -z $branchname ]; then
    return
  fi

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch="%{${fg[green]}%}($branchname)%{$reset_color%}"
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    branch="%{${fg[yellow]}%}($branchname)%{$reset_color%}"
  else
    branch="%{${fg[red]}%}($branchname)%{$reset_color%}"
  fi

  remote=`git config branch.${branchname}.remote 2> /dev/null`

  if [ -z $remote ]; then
    pushed=''
  else
    upstream="${remote}/${branchname}"
    if [[ -z `git log ${upstream}..${branchname}` ]]; then
      pushed="%{${fg[green]}%}[up]%{$reset_color%}"
    else
      pushed="%{${fg[red]}%}[up]%{$reset_color%}"
    fi
  fi

  echo "$branch$pushed"
}

# PROMPT='%n@%m`git-prompt` %# '
PROMPT='($(arch)) %2c %# '
# RPROMPT='%{$fg_bold[cyan]%}[%C]%{$reset_color%}'
RPROMPT='`git-prompt` %{$fg_bold[cyan]%}%{$reset_color%}'
