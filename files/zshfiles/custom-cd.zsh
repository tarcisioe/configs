require python-utils

function custom-cd {
    builtin cd "$@"
    python-cd-hooks
}

function activate-custom-cd {
    alias cd='custom-cd'
}

function deactivate-custom-cd {
    unalias cd
}

activate-custom-cd

export EDITOR=vim
