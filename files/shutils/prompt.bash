require check-root
require colors


COLOR=$(not-root && printf "${LIGHT_BLUE}" || printf "${DARK_RED}")

function make_escape {
    echo "\[\033[$1m\]"
}

function color_code {
    echo "38;5;$1"
}

function make_color {
    make_escape "$(color_code $1)"
}

function make_end {
    make_escape 0
}

function make_bold_color {
    make_escape "01;$(color_code "$1")"
}

COLOR=$(make_bold_color ${COLOR})
WHITE=$(make_bold_color ${WHITE})
END=$(make_end)

PS1="${COLOR}\u${WHITE}:${COLOR}\h${WHITE} \w ${COLOR}\$${END} "
