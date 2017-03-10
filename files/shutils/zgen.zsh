ZGEN="${INITPATH}"/zgen/zgen.zsh

if [[ -f "${ZGEN}" ]]
then
    . "${ZGEN}"
else
    function zgen {}
fi
