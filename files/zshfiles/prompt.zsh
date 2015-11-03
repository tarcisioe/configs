require git-color
require vim-color
require check-root

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

# define left-prompt
PROMPT='%B%F{${COLOR}}%n%f:%F{${COLOR}}%m%f %c %F{${prompt_vim_color}}%(#~#~$)%f%b '

ZLE_RPROMPT_INDENT=0

# define right-prompt if not root, showing git information
if [[ ${ROOT} == 0 ]]
then
    autoload -U vcs_info

    zstyle ':vcs_info:*' action_formats '%b|%a'
    zstyle ':vcs_info:*' formats '%b'
    precmd() {
        vcs_info
        if [[ -n "${vcs_info_msg_0_}" ]]
        then
            GIT_INFO="(%{$fg[$(git-color)]%}${vcs_info_msg_0_}%{$reset_color%})"
        else
            GIT_INFO=''
        fi
        RETURN="%(?.. %? ↵"
        RPROMPT="${GIT_INFO}${RETURN}"
    }
fi

