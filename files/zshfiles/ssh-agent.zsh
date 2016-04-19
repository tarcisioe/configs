SSH_ENV="${HOME}/.ssh/environment"

function source_agent_info {
    . "${SSH_ENV}" > /dev/null
    ps -ef | \
    grep "${SSH_AGENT_PID}" | \
    grep 'ssh-agent$' > /dev/null
}

function start_agent {
    ssh-agent | sed '/^echo/d' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    source_agent_info
}

[[ -f "${SSH_ENV}" ]] && source_agent_info || start_agent
