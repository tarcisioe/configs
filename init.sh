#!/bin/bash

install-scripts() {
    local workspace="${HOME}/workspace"
    local scripts="${workspace}/scripts"

    mkdir -p "${workspace}" &&
    [[ ! -d "${scripts}" ]] &&
        git clone git@github.com:tarcisioe/scripts "${scripts}"
}

git submodule init
git submodule update
bash link.sh
bash migrate.sh

install-scripts
