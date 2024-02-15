COLORFILE="${HOME}"/.dir_colors
COLORMODULE="${INITPATH}"/_dircolors.sh

{ {! [[ -f "${COLORMODULE}" ]]} || [[ "${COLORFILE}" -nt "${COLORMODULE}" ]] } &&
    dircolors "${COLORFILE}" > "${COLORMODULE}"

require _dircolors
