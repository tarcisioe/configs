function find-file-backwards {
    local current_path="${PWD}"
    while [[ "${current_path}" != "/" ]]
    do
        local file="${current_path}/$1"
        if [ -f "${file}" ]
        then
            echo "${file}"
            return
        fi
        current_path="$(dirname "${current_path}")"
    done
}
