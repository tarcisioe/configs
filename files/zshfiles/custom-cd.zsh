require find-file-backwards

function -enter-venv {
    local venvfile="$(find-file-backwards .venv)"

    if [[ -z "${venvfile}" ]]
    then
        [[ -n "${VIRTUAL_ENV}" ]] && deactivate
        return
    fi

    local venv="$(dirname "${venvfile}")/$(cat "${venvfile}")"

    if [[ -z "${VIRTUAL_ENV}" || "$(readlink -f "${VIRTUAL_ENV}")" != "$(readlink "${venv}")" ]]
    then
        . "${venv}/bin/activate"
        return
    fi
}

function -export-pylintrc {
    local rc_path="$(find-file-backwards pylintrc)"

    if [[ -n ${rc_path} ]]
    then
        export PYLINTRC="${rc_path}"
    else
        unset PYLINTRC
    fi
}

function custom-cd {
    builtin cd $@
    -enter-venv
    -export-pylintrc
}

function activate-custom-cd {
    alias cd='custom-cd'
}

function deactivate-custom-cd {
    unalias cd
}

activate-custom-cd

export EDITOR=vim
