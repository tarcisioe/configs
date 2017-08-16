[[ -n "${BASE_VARS_DEFINED}" ]] && return

export PATH="${HOME}/.local/bin:/usr/local/bin:${PATH}"

if /usr/bin/which nvim 2> /dev/null > /dev/null
then
    EDITOR=nvim
elif /usr/bin/which vim 2> /dev/null > /dev/null
then
    EDITOR=vim
elif /usr/bin/which nano 2> /dev/null > /dev/null
then
    EDITOR=nano
fi

export EDITOR

export BASE_VARS_DEFINED=1
