require custom-cd
require find-file-backwards

function -export-pylintrc {
    local rc_path="$(find-file-backwards pylintrc)"

    [[ -z ${rc_path} ]] && {
        unset PYLINTRC
        return 0
    }

    export PYLINTRC="${rc_path}"
}

function -enter-venv {
    local venv="$(find-file-backwards .venv)"

    [[ -z "${venv}" ]] &&
    {
        [[ -z "${VIRTUAL_ENV}" ]] && return 0

        deactivate
        return 0
    }

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

cd-hook python-cd-hooks
