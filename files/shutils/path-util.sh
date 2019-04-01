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
