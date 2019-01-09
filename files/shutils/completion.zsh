require check-root
require dircolors

# add ./comp to completion path
if [[ ${ROOT} == 0 ]]
then
    fpath=("${INITPATH}"/comp $fpath)
fi

# load zsh completion utilities
autoload -U compinit && compinit

# configure completion to behave nicely
zstyle ':completion:*' insert-unambiguous true # insert directly if not in doubt
zstyle ':completion:*' insert-tab false # never insert tab
zstyle ':completion:*' menu select # use the menu completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}" # use same colors as ls
setopt complete_aliases # do not expand aliases before completion
