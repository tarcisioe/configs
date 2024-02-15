if [[ -n "$ZSH_VERSION" ]]
then
    INIT_SH="zsh"
elif [[ -n "$BASH_VERSION" ]]
then
    INIT_SH="bash"
else
    return
fi

INITPATH="$(realpath ${1})"
MY_SCRIPTS_PATH=$INITPATH

declare -A SHUTIL_MODULE_PATHS

function shutil-module-path {
    local shutil_module_name="${1}"

    local lookup="${SHUTIL_MODULE_PATHS["${1}"]:-}"
    [[ -n "${lookup}" ]] &&
    {
        echo "${lookup}"
        return 0
    }

    local partial="${INITPATH}"/"${1}"

    local preferred="${partial}.${INIT_SH}"

    local result=$([[ -f "${preferred}" ]] && echo "${preferred}" || echo "${partial}.sh")

    SHUTIL_MODULE_PATHS["${shutil_module_name}"]="${result}"
    echo "${result}"
}

declare -A REQUIRES

function require {
    local shutil_module_name="${1}"
    local already_required="${REQUIRES["${shutil_module_name}"]:-}"

    [[ -n "${already_required}" ]] &&
        return 0

    if ! source "$(shutil-module-path "${shutil_module_name}")"
    then
        echo "Could not require '${shutil_module_name}' successfully." >&2
        return 1
    fi
    REQUIRES["${shutil_module_name}"]=1
}

function _require {
    local shutil_module_name="${1}"
    local already_required="${REQUIRES["${shutil_module_name}"]:-}"

    timer=$(date +%s%3N)
    LEVELS=$(($LEVELS + 1))
    _require "${@}"
    LEVELS=$(($LEVELS - 1))
    now=$(date +%s%3N)
    elapsed=$(($now-$timer))

    [[ "${elapsed}" -gt 10 ]] &&
    {
        for i in $(seq $LEVELS)
        do
            echo -n "    "
        done

        echo -n "Required ${1} in ${elapsed} milliseconds." &&
        {
            [[ -n "${already_required}" ]] &&
            echo -n " (Was already required)"
        }
        echo
    }
}

function require-if-exists {
    local shutil_module_name="${1}"

    local shutil_module_path
    shutil_module_path="$(shutil-module-path "${shutil_module_name}")"

    [[ -f "${shutil_module_path}" ]] ||
        return 1

    require "${shutil_module_name}"
}
