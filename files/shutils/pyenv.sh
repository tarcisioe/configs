require path-util


if [[ "${ROOT}" == "0" ]]
then
    add-path "${HOME}/.local/share/pyenv/bin"
    eval "$(pyenv init -)"
    remove-path "${HOME}/.local/share/pyenv/bin"
    remove-path "${HOME}/.local/share/pyenv/shims"
fi
