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

curl -fLo files/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install-scripts
