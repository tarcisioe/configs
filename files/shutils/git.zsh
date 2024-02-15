require find-file-backwards

GITSTATUS_TOKEN=TOKEN_$$

function load-gitstatus {
    local git_folder
    find-file-backwards git_folder .git

    [[ -n "${git_folder}" ]] && {
        require plugins

        gitstatus_start "${GITSTATUS_TOKEN}"

        function load-gitstatus {
        }
    } || return 1
}

function -git-color {
    if [[ "${VCS_STATUS_RESULT}" != ok-sync ]]
    then
        return
    fi

    if [[ ${VCS_STATUS_HAS_UNSTAGED} == 1 ]] || [[ ${VCS_STATUS_HAS_UNTRACKED} == 1 ]]
    then
        echo 'red'
        return
    fi

    if [[ ${VCS_STATUS_HAS_STAGED} == 1 ]]
    then
        echo 'yellow'
        return
    fi

    echo 'green'
}


function -git-head() {
    if [[ "${VCS_STATUS_RESULT}" != ok-sync ]]
    then
        return
    fi

    local head="${VCS_STATUS_LOCAL_BRANCH}"

    if [[ -z "${head}" ]]
    then
        head="${VCS_STATUS_COMMIT[1,7]}"
    fi

    echo "${head}"
}


function git-info() {
    gitstatus_query -d $PWD "${GITSTATUS_TOKEN}"

    if [[ "${VCS_STATUS_RESULT}" != ok-sync ]]
    then
        return
    fi

    echo "(%{$fg[$(-git-color)]%}$(-git-head)%{$reset_color%})"
}
