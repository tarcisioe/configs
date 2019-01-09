require find-file-backwards
require custom-cd

NODE_ENV=""
NODE_OLD_PATH=""

function -activate-node-env {
    if [[ -z "${NODE_ENV}" ]]
    then
        NODE_OLD_PATH="${PATH}"
    fi

    export PATH="$1/.bin:${PATH}"

    NODE_ENV="$1"
}

function -leave-node-env {
    if [[ -z "${NODE_ENV}" ]]
    then
        return
    fi

    export PATH="${NODE_OLD_PATH}"

    NODE_ENV=""
    NODE_OLD_PATH=""
}

function -enter-node-env {
    local node_env="$(find-file-backwards node_modules)"

    if [[ -z "${node_env}" ]]
    then
        [[ -n "${NODE_ENV}" ]] && -leave-node-env
        return 0
    fi

    if [[ -z "${NODE_ENV}" || "$(readlink -f "${NODE_ENV}")" != "$(readlink "${node_env}")" ]]
    then
        -activate-node-env "${node_env}"
        return
    fi
}

nvm() {
    unset -f nvm
    export NVM_DIR="$(realpath "${HOME}/.nvm")"
    [[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"  # This loads nvm
    nvm "$@"
}

cd-hook -enter-node-env
