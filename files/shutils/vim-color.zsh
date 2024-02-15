require colors

# this function returns what color to use in prompt (only when changing keymap)
function vim-color {
    local output="${1}"

    case $KEYMAP in
        main|viins) assign "${output}" "${LIGHT_BLUE}" ;;
        vicmd) assign "${output}" "${DARK_RED}" ;;
        vivis) assign "${output}" "${DARK_ORANGE}" ;;
    esac
}
