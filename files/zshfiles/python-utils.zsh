require find-file-backwards

function -export-pylintrc {
    local rc_path="$(find-file-backwards pylintrc)"

    if [[ -n ${rc_path} ]]
    then
        export PYLINTRC="${rc_path}"
    else
        unset PYLINTRC
    fi
}

function -enter-venv {
    local venv="$(find-file-backwards .venv)"

    if [[ -z "${venv}" ]]
    then
        [[ -n "${VIRTUAL_ENV}" ]] && deactivate
        return
    fi

    if [[ -z "${VIRTUAL_ENV}" || "$(readlink -f "${VIRTUAL_ENV}")" != "$(readlink "${venv}")" ]]
    then
        . "${venv}/bin/activate"
        return
    fi
}

function python-cd-hooks {
    -enter-venv
    -export-pylintrc
}

function mkvenv {
    local python="${1}"
    [[ -n ${python} ]] || python=python
    local module="venv"
    [[ $(${python} -V 2>&1) =~ "Python 3" ]] || module="virtualenv"
    ${python} -m ${module} .venv
    -enter-venv
    pip install --upgrade pip
}
