if [[ "$ZSH_VERSION" != "" ]]
then
    INIT_SH=zsh
    INIT_BASENAME="${0}"
elif [[ "$BASH_VERSION" != "" ]]
then
    INIT_SH=bash
    INIT_BASENAME="${BASH_SOURCE[0]}"
else
    return
fi

INITPATH="$(cd "$(dirname "${INIT_BASENAME}")"; pwd -P)"
MY_SCRIPTS_PATH=$INITPATH

function script-path {
    local partial="${INITPATH}"/"${1}"
    case "${INIT_SH}" in
        zsh)
            local preferred="${partial}".zsh ;;
        bash)
            local preferred="${partial}".bash ;;
    esac

    [[ -f "${preferred}" ]] && echo "${preferred}" || echo "${partial}.sh"
}

function require {
    local importedvar=${1//-/_}_IMPORTED

    case $INIT_SH in
        zsh)
            local is_imported=${(P)importedvar} ;;
        bash)
            local is_imported=${!importedvar} ;;
    esac

    [[ ${is_imported} == "1" ]] && return 0

    if source "$(script-path "${1}")"
    then
        eval ${importedvar}=1
        return 0
    else
        echo "Could not require '${1}' successfully, with path '$(script-path "${1}")'." >&2
        return -1
    fi
}

function require-if-exists {
    [[ -f "$(script-path "${1}")" ]] && require "${1}" || return 1
}
