#!/usr/bin/env sh

set -e

VIMDIR="${VIMDIR:-$HOME/.vim}"
P="$(pwd)"

lln() {
    lnp="$2/$(basename -- "$1")"
    if [ -h "$lnp"  ]; then
        echo "$lnp is a symlink, unlinking"
        unlink "$lnp"
    fi

    ln -s "$1" "$2"
}

main() {
    echo 'Installing vim syntax'

    mkdir -p -- "$VIMDIR/syntax" "$VIMDIR/ftdetect"
    lln "$P/editor/fa.vim" "$VIMDIR/syntax"
    lln "$P/editor/fa.ftp.vim" "$VIMDIR/ftdetect"

    echo 'Installing fac to local binaries'
    mkdir -p "$HOME/.local/bin"
    lln "$P/src/fac" "$HOME/.local/bin"

    echo 'Done'
}

main "$@"
