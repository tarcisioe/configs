MY_SCRIPTS_PATH=$1

function require {
    local modulename=$1
    local importedvar=${modulename//-/_}_IMPORTED
    local is_imported=${(P)${importedvar}}

    if [[ ${is_imported} == "1" ]]
    then
        return 0
    fi

    if source ${MY_SCRIPTS_PATH}/${modulename}.zsh
    then
        eval ${importedvar}=1
        return 0
    else
        echo "Could not require '${modulename}' successfully, with path '${MY_SCRIPTS_PATH}'."
        return -1
    fi
}

function require-if-exists {
    local modulename=$1

    if [[ -f ${MY_SCRIPTS_PATH}/${modulename}.zsh ]]
    then
        require ${modulename}
        return 0
    else
        return 1
    fi
}
