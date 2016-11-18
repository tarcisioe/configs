COLORFILE="${HOME}"/.dir_colors
[[ -f "${COLORFILE}" && "$(tput colors)" == 256 ]] && which dircolors > /dev/null && eval $(dircolors "${COLORFILE}") || return 0
