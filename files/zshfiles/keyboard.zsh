# load utilities
autoload zkbd
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# set hooks for better history searching
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# load the definitions for the keyboard
# if local definitions are needed, place in ${PACKAGES}/local-kbd.zsh
require-if-exists local-kbd || require-if-exists default-kbd

# helper function to bind key to action if key is valid
function setup-key {
    [[ -n "${1}" ]] && bindkey "${1}" "$2"
}

# setup vi mode and bind keys
set -o vi
setup-key "${key[Home]}" beginning-of-line
setup-key "${key[End]}" end-of-line
setup-key "${key[Insert]}" overwrite-mode
setup-key "${key[Delete]}" delete-char
setup-key "${key[Up]}" up-line-or-beginning-search
setup-key "${key[Down]}" down-line-or-beginning-search
setup-key "${key[Left]}" backward-char
setup-key "${key[Right]}" forward-char
