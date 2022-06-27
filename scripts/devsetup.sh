#!/usr/bin/env sh

set -e

VIMDIR="${VIMDIR:-"$HOME/.vim"}"
KVER="${KVER:-5.18}"
BASHCOMP_DIR="${BASHCOMP_DIR:-"$HOME/.local/share/bash-completion/completions"}"
LOCALLIB_DIR="${LOCALLIB_DIR:-"$HOME/.local/include/fa"}"
SYSCALL_TABLE="https://raw.githubusercontent.com/torvalds/linux/v${KVER}/arch/x86/entry/syscalls/syscall_64.tbl"
P="$(pwd)"

log() {
    echo " * $1"
}

lln() {
    lnp="$2/$(basename -- "$1")"
    if [ -h "$lnp" ]; then
        log "$lnp is a symlink, relinking"
        unlink "$lnp"
    fi

    ln -s "$1" "$2"
}

check_deps() {
    for dep in "$@"; do
        if ! command -v -- "$dep" >/dev/null; then
            log "Please install a package that supplies '$dep'" >&2
            exit 1
        fi
    done
}

main() {
    check_deps basename unlink ln mkdir curl python3

    log 'Installing vim syntax'

    mkdir -p -- "$VIMDIR/syntax" "$VIMDIR/ftdetect" "$VIMDIR/complete"
    lln "$P/editor/fa.vim" "$VIMDIR/syntax"
    lln "$P/editor/fa.ftp.vim" "$VIMDIR/ftdetect"
    lln "$P/editor/fa_completion.clist" "$VIMDIR/complete"

    log 'Installing shell completions'

    mkdir -p -- "$BASHCOMP_DIR"
    lln "$P/completions/bash/fac" "$BASHCOMP_DIR"

    log 'Installing fac to local binaries'

    mkdir -p "$HOME/.local/bin"
    lln "$P/src/fac" "$HOME/.local/bin"

    log 'Generating syscall table'

    {
        echo '--<'
        echo "    Linux syscall mapping for Linux v$KVER"
        echo "    Source: $SYSCALL_TABLE"
        echo '>--'
        echo

        curl -fLsS -- "$SYSCALL_TABLE" | ./scripts/syscalls.py
    } >'std/syscalls.fa'

    log 'Installing fa stdlib locally'

    mkdir -p -- "$LOCALLIB_DIR"
    [ -h "$LOCALLIB_DIR/std" ] && log 'Relinking current stdlib' && unlink "$LOCALLIB_DIR/std"
    ln -s "$P/std" "$LOCALLIB_DIR/std"

    log 'Done'
}

main "$@"
