require colors

# this function returns what color to use in prompt (only when changing keymap)
function vim-color {
    echo "${${KEYMAP/vicmd/${DARK_RED}}/(main|viins)/${LIGHT_BLUE}}"
}
