function add-path {
    [[ ":$PATH:" != *":${1}:"* ]] && export PATH="${1}:${PATH}"
}

function first-of {
    for i in "$@"
    do
        if /usr/bin/which "$i" 2> /dev/null > /dev/null
        then
            echo "$i"
            return
        fi
    done
}

add-path /usr/local/bin
add-path "${GOPATH}/bin"
add-path "${HOME}/.local/share/npm/bin"
add-path "${HOME}/.local/bin"

export EDITOR="$(first-of nvim vim nano)"
export TERMINAL="$(first-of st urxvt)"

export GOPATH="$HOME/.gopath"
