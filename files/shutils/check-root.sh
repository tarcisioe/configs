not-root() {
    return $((${EUID} == 0))
}
