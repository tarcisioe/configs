require colors

# this function returns what color to use in prompt (only when changing keymap)
function vim-color {
    case $KEYMAP in
        main|viins) echo "${LIGHT_BLUE}" ;;
        vicmd) echo "${DARK_RED}" ;;
        vivis) echo "${DARK_ORANGE}" ;;
    esac
}
