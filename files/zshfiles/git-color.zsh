require find-file-backwards

function git-color {
    if ! which git > /dev/null 2>&1
    then
        return
    fi

    if [[ -n "$(git ls-files --other --exclude-standard 2> /dev/null)" ]] || ! git diff-files --quiet --ignore-submodules 2> /dev/null
    then
        echo 'red'
        return
    fi

    if ! git diff-index --cached --quiet --ignore-submodules HEAD -- 2> /dev/null
    then
        echo 'yellow'
        return
    fi

    echo 'green'
}

