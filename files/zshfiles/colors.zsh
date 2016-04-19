# color aliases
if [[ $TERM =~ '256color$' ]]
then
    LIGHT_BLUE=25
    DARK_RED=124
    DARK_ORANGE=172
else
    LIGHT_BLUE=4
    DARK_RED=1
    DARK_ORANGE=3
fi

autoload colors && colors
