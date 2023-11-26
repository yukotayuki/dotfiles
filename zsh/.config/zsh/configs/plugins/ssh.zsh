function print_osc() {
    # tmux 3.3 以降は allow-passthrough on を有効に
    if [[ -n $TMUX ]] ; then
        printf "\ePtmux;\e\e]";
    else
        printf "\e]";
    fi
}

function print_st() {
    if [[ -n $TMUX ]] ; then
        printf "\a\e\\";
    else
        printf "\a";
    fi
}

function ssh_change_profile() {
    # set profile
    print_osc
    echo -ne "1337;SetProfile=$@"
    print_st

    # ssh login
    ssh "$@"

    # set profile(default)
    print_osc
    echo -ne "1337;SetProfile=Default"
    print_st
}
