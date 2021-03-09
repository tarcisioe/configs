require check-root
require path-util


if not-root
then
    add-path "${HOME}/.local/share/pyenv/bin"
    eval "$(pyenv init -)"
fi
