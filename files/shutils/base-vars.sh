require path-util

function first-of {
    local output="${1}"

    local i

    for i in "${@:2}"
    do
        if which "$i" 2> /dev/null > /dev/null
        then
            assign "${1}" "${i}"
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
add-path "${HOME}/workspace/scripts/bin"

export EDITOR
first-of EDITOR nvim vim nano

export TERMINAL
case "${XDG_SESSION_TYPE}" in
    "wayland")
        TERMINAL="footclient-autostart" ;;
    "x11")
        TERMINAL="urxvtc-autostart" ;;
esac

export BROWSER
first-of BROWSER firefox chromium google-chrome
