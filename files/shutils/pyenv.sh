require check-root
require path-util


if not-root
then
    add-path "${HOME}/.local/share/pyenv/bin"
    (which pyenv > /dev/null) && eval "$(pyenv init -)" || true
fi
