CONFIGSROOT="$(cd "$(dirname "$0")" && pwd)"

source "${CONFIGSROOT}"/core.sh

check-mapped-in-files() {
    [[ -e "$src" ]] && return
    echo Warning: file "$src" does not exist.
}

check-files-in-mapping() {
    for file in "${CONFIGSROOT}"/files/*
    do
        function check-file-in-mapping {
            [[ "$src" == "$file" ]] && echo found
        }

        [[ -n "$(callonmapping check-file-in-mapping)" ]] || \
            echo Warning: file "$file" not in mapping
    done
}

callonmapping check-mapped-in-files
check-files-in-mapping
