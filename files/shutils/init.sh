if [[ -n "$ZSH_VERSION" ]]
then
    INIT_SH="zsh"

    function assign {
        : ${(P)1::="${2}"}
    }

elif [[ -n "$BASH_VERSION" ]]
then
    INIT_SH="bash"

    function assign {
        local -n output="${1}"
        output="${2}"
    }
else
    return
fi

INITPATH="$(realpath ${1})"
MY_SCRIPTS_PATH=$INITPATH

declare -A SHUTIL_MODULE_PATHS

function shutil-module-path {
    local output="${1}"
    local shutil_module_name="${2}"

    local lookup="${SHUTIL_MODULE_PATHS["${shutil_module_name}"]:-}"
    [[ -n "${lookup}" ]] &&
    {
        assign "${output}" "${lookup}"
        return 0
    }

    local partial="${INITPATH}"/"${shutil_module_name}"

    local preferred="${partial}.${INIT_SH}"

    local result
    [[ -f "${preferred}" ]] &&
        result="${preferred}" ||
        result="${partial}.sh"

    SHUTIL_MODULE_PATHS["${shutil_module_name}"]="${result}"
    assign "${output}" "${result}"
}

declare -A REQUIRES

function _source_module {
    local shutil_module_name="${1}"
    local shutil_module_path
    shutil-module-path shutil_module_path "${shutil_module_name}"

    source "${shutil_module_path}" ||
        {
            echo "Could not require '${shutil_module_name}' successfully." >&2
            return 1
        }

    REQUIRES["${shutil_module_name}"]=0
}

function already-required {
    local shutil_module_name="${1}"
    local already_required="${REQUIRES["${shutil_module_name}"]:-1}"

    return "${already_required}"
}

function require {
    local shutil_module_name="${1}"

    already-required "${shutil_module_name}" ||
        _source_module "${shutil_module_name}"
}

function require-if-exists {
    local shutil_module_name="${1}"

    local shutil_module_path
    shutil-module-path shutil_module_path "${shutil_module_name}"

    [[ -f "${shutil_module_path}" ]] ||
        return 1

    require "${shutil_module_name}"
}
