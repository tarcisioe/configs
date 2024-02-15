require check-root
require vim-color

declare PROMPT_VIM_COLOR

# setup hook for line-init, just needed for first time
function zle-line-init {
    vim-color PROMPT_VIM_COLOR
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
PROMPT_COLOR="$(
    not-root && printf "${LIGHT_BLUE}" || printf "${DARK_RED}"
)"

# define left-prompt
PROMPT='%B%F{${PROMPT_COLOR}}%n%f:%F{${PROMPT_COLOR}}%m%f %c %F{${PROMPT_VIM_COLOR}}%(#~#~$)%f%b '

ZLE_RPROMPT_INDENT=1

# define right-prompt if not root, showing git information
if not-root
then
    require git

    precmd() {
        load-gitstatus && {
            RETURN="%(?.. %? ↵"
            RPROMPT="$(git-info)${RETURN}"
        }
    }
fi
