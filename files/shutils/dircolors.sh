COLORFILE="${HOME}"/.dir_colors

[[ -f "${COLORFILE}" ]] && eval "$(dircolors "${COLORFILE}")"
