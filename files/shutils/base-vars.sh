function add-path {
    [[ ":$PATH:" != *":${1}:"* ]] && export PATH="${1}:${PATH}" || return 0
}

function remove-path() {
   local p=":$1:"
   local d=":$PATH:"
   d=${d//$p/:}
   d=${d/#:/}
   export PATH=${d/%:/}
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

export EDITOR="$(first-of nvim vim nano)"
export TERMINAL="$(first-of st urxvt)"

export GOPATH="$HOME/.gopath"

add-path /usr/local/bin
add-path "${GOPATH}/bin"
add-path "${HOME}/.local/share/npm/packages/bin"
add-path "${HOME}/.cargo/bin"
add-path "${HOME}/.local/bin"
