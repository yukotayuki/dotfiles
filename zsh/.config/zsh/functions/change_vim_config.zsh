function change_vim_config() {
  local nvim_path="$HOME/.config/nvim"
  if [ "$1" = "vim" ]; then
    echo "change lua to vim config"
    echo $nvim_path
    if [[ -e $nvim_path/init.lua ]]; then
      mv $nvim_path/init.lua $nvim_path/_init.lua
    fi
    if [[ -e $nvim_path/_init.vim ]]; then
      mv $nvim_path/_init.vim $nvim_path/init.vim
    fi
  elif [ "$1" = "lua" ]; then
    echo "change vim to lua config"
    if [[ -e $nvim_path/_init.lua ]]; then
      mv $nvim_path/_init.lua $nvim_path/init.lua
    fi
    if [[ -e $nvim_path/init.vim ]]; then
      mv $nvim_path/init.vim $nvim_path/_init.vim
    fi
  else
    echo "Not implemented."
    return 1
  fi
}
