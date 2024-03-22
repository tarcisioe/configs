CD_HOOKS=()

function cd-hook {
    CD_HOOKS+=("$*")
}

function cd-unhook {
    unset "CD_HOOKS[$1]"
    CD_HOOKS=(${CD_HOOKS[@]})
}

function -cd-hook-keys {
    case "${INIT_SH}" in
        bash) seq 0 $((${#CD_HOOKS[@]}-1)) ;;
        zsh) seq 1 ${#CD_HOOKS} ;;
    esac
}

function cd-hooks {
    local key

    for key in $(-cd-hook-keys)
    do
        echo "$key" "${CD_HOOKS[$key]}"
    done
}

function custom-cd {
    builtin cd "$@"

    local hook

    for hook in "${CD_HOOKS[@]}"
    do
        "$hook"
    done
}

function activate-custom-cd {
    alias cd='custom-cd'
}

function deactivate-custom-cd {
    unalias cd
}

activate-custom-cd
