ZGEN="${MY_SCRIPTS_PATH}"/zgen/zgen.zsh

if [[ -f "${ZGEN}" ]]
then
    . "${ZGEN}"
else
    function zgen {}
fi
