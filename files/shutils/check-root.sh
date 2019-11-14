# variable ROOT is 1 if you are root, 0 otherwise

not-root() {
    return $((${EUID} == 0))
}
