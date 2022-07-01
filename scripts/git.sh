#!/usr/bin/env sh

set -e

main() {
    sh ./scripts/docindex.sh
    bash ./scripts/test.sh

    git add -A
    git commit -sa
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}

main "$@"
