require path-util

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

export GOPATH="$HOME/.gopath"
export PYENV_ROOT="$HOME/.local/share/pyenv"

add-path /usr/local/bin
add-path "${GOPATH}/bin"
add-path "${PYENV_ROOT}/bin"
add-path "${PYENV_ROOT}/shims"
add-path "${HOME}/.local/share/npm/packages/bin"
add-path "${HOME}/.cargo/bin"

remove-path "${HOME}/.local/bin"
add-path "${HOME}/.local/bin"

export EDITOR="$(first-of nvim vim nano)"
export TERMINAL="$(first-of st urxvt)"
export BROWSER="$(first-of firefox chromium google-chrome)"
