#!/usr/bin/env sh

set -e

VIMDIR="${VIMDIR:-"$HOME/.vim"}"
BASHCOMP_DIR="${BASHCOMP_DIR:-"$HOME/.local/share/bash-completion/completions"}"
P="$(pwd)"

lln() {
    lnp="$2/$(basename -- "$1")"
    if [ -h "$lnp" ]; then
        echo " ** $lnp is a symlink, unlinking"
        unlink "$lnp"
    fi

    ln -s "$1" "$2"
}

main() {
    echo 'Installing vim syntax'

    mkdir -p -- "$VIMDIR/syntax" "$VIMDIR/ftdetect" "$VIMDIR/completion"
    lln "$P/editor/fa.vim" "$VIMDIR/syntax"
    lln "$P/editor/fa.ftp.vim" "$VIMDIR/ftdetect"
    lln "$P/editor/fa_completion.clist" "$VIMDIR/complete"

    echo 'Installing shell completions'

    mkdir -p -- "$BASHCOMP_DIR"
    lln "$P/completions/bash/fac" "$BASHCOMP_DIR"

    echo 'Installing fac to local binaries'

    mkdir -p "$HOME/.local/bin"
    lln "$P/src/fac" "$HOME/.local/bin"

    echo 'Done'
}

main "$@"
