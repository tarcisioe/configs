require check-root
require git
require vim-color

# setup hook for line-init, just needed for first time
function zle-line-init {
    prompt_vim_color=$(vim-color)
    zle reset-prompt
}

# setup hook for keymap-select, calls line-init and recolors the prompt
function zle-keymap-select {
    zle-line-init
}

zle -N zle-line-init
zle -N zle-keymap-select

# enables variable substitution inside prompts
setopt prompt_subst

# select color based on being root or not
COLOR="$(print -P "%(#~${DARK_RED}~${LIGHT_BLUE})")"

function color {
    [[ $ROOT == "1" ]] && echo $DARK_RED || echo $LIGHT_BLUE
}

# define left-prompt
PROMPT='%B%F{$(color)}%n%f:%F{$(color)}%m%f %c %F{${prompt_vim_color}}%(#~#~$)%f%b '

ZLE_RPROMPT_INDENT=1

# define right-prompt if not root, showing git information
if [[ ${ROOT} == 0 ]]
then
    precmd() {
        RETURN="%(?.. %? ↵"
        RPROMPT="$(git-info)${RETURN}"
    }
fi

