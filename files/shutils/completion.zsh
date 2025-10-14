require check-root
require dircolors

# add ./comp to completion path
not-root && fpath=("${INITPATH}"/comp $fpath)

function mod-day {
    local file_path="${1}"

    { stat -c '%y' "${file_path}" | cut -d' ' -f1 }
}

function _compinit {
    # load zsh completion utilities
    autoload -Uz compinit &&
    [[ "$(date +'%Y-%m-%d')" != "$(mod-day ~/.zcompdump)" ]] &&
        compinit ||
        compinit -C
}

_compinit

# configure completion to behave nicely
zstyle ':completion:*' insert-unambiguous true # insert directly if not in doubt
zstyle ':completion:*' insert-tab false # never insert tab
zstyle ':completion:*' menu select # use the menu completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}" # use same colors as ls
setopt complete_aliases # do not expand aliases before completion
