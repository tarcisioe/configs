require check-root
require path-util


if not-root
then
    add-path "${HOME}/.local/share/pyenv/bin"
    eval "$(pyenv init -)"
    remove-path "${HOME}/.local/share/pyenv/bin"
    remove-path "${HOME}/.local/share/pyenv/shims"
fi
