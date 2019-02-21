require find-file-backwards
require custom-cd
require check-root

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
        if [[ -n "${VIRTUAL_ENV}" ]]
        then
            [[ "${CONDA_SHLVL}" > 0 ]] && return 0  # oh shit this is conda, I hate conda
            deactivate
        fi
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

cd-hook python-cd-hooks

function mkvenv {
    local python="${1}"
    [[ -n ${python} ]] || python=python
    local module="venv"
    [[ $(${python} -V 2>&1) =~ "Python 3" ]] || module="virtualenv"
    ${python} -m ${module} .venv
    -enter-venv
    pip install --upgrade pip
}

if [[ "${ROOT}" == "0" ]]
then
    eval "$(pyenv init -)"
fi
