require check-root

if [[ ! (${ROOT} == 1) ]]
then
    require zgen

    if ! zgen saved
    then
        zgen oh-my-zsh plugins/pip
        zgen load b4b4r07/zsh-vimode-visual

        zgen save
    fi
fi
