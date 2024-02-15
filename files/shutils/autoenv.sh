require custom-cd
require find-file-backwards

AUTOENV_CURRENT=

function -autoenv-exit() {
    env-exit &&
    unfunction env-exit &&
    AUTOENV_CURRENT=
}

function -autoenv-enter() {
    source "$1" &&
    AUTOENV_CURRENT="${1}"
}

function -autoenv() {
    local env
    find-file-backwards env .env

    if [[ -n "${AUTOENV_CURRENT}" ]] && [[ -n "${env}" ]]
    then
        return 0
    fi

    if [[ -n "${AUTOENV_CURRENT}" ]]
    then
        -autoenv-exit &&
        return 0
    fi

    if [[ -n ${env} ]]
    then
        -autoenv-enter "${env}"
    fi
}

cd-hook -autoenv
