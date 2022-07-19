#!/usr/bin/env sh

set -e

yn() {
    printf ' ?? %s? [y/N] ' "$1"
    read -r yn
    [ "$yn" = 'y' ]
}

main() {
    if yn 'Did you add a new feature'; then
        yn 'Did you an entry for it to all_features.fa'
        yn 'Did you add both failing and passing tests for it'
        yn 'Did you add documentation for it'
        yn 'Did you add an entry to fa.vim'
    fi

    sh ./scripts/docindex.sh
    bash ./scripts/test.sh

    git diff >/tmp/fa.diff

    git add -A
    git commit -sa
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}

main "$@"
