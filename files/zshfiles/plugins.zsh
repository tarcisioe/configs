require check-root

if [[ ! (${ROOT} == 1) ]]
then
    if require-if-exists antigen
    then
        antigen bundle pip

        antigen apply
    fi
fi
