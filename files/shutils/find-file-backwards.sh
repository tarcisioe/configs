function find-file-backwards {
    local output="${1}"
    local filename="${2}"

    local current_path="${PWD}"
    while [[ "${current_path}" != "/" ]]
    do
        local file="${current_path}/${filename}"
        if [ -e "${file}" ]
        then
            assign "${output}" "${file}"
            return
        fi
        current_path="$(dirname "${current_path}")"
    done
}
