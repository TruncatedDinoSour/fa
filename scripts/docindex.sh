#!/usr/bin/env sh

set -e

main() {
    printf '%s... ' 'Generating documentation index'

    rm -f -- doc/README.md

    {
        echo "# Fa documentation index"

        for file in doc/md/*; do
            echo "- [$(head -n 1 "$file" | sed 's/^# //')](/$file)"
        done
    } >doc/README.md

    echo 'done'
}

main "$@"
