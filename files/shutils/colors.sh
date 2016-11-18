# color aliases
if [[ $TERM =~ "256color" ]]
then
    LIGHT_BLUE=25
    DARK_RED=124
    DARK_ORANGE=172
    WHITE=15
else
    LIGHT_BLUE=4
    DARK_RED=1
    DARK_ORANGE=3
    WHITE=15
fi

if [[ "${INIT_SH}" == zsh ]]
then
    autoload colors && colors
fi
