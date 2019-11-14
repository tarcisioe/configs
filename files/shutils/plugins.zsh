require check-root

if not-root
then
    require zgen

    if ! zgen saved
    then
        zgen oh-my-zsh plugins/pip
        zgen load b4b4r07/zsh-vimode-visual
        zgen load romkatv/gitstatus

        zgen save
    fi
fi
