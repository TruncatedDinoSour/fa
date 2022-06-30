#!/usr/bin/env bash

set -e

log() { echo " * $1"; }
mmkdir() { mkdir -p -- "$1"; }

run_tests() {
    echo
    mmkdir "$1"
    cd "$1"

    for ptest in ../"$2"/*; do
        pptest="${ptest##*/}"
        _ex="/tmp/fa.$RANDOM.$pptest.lock"

        log "Testing ($3 mode): $pptest"

        {
            _cmd="echo | fac \"\$ptest\" -run"

            case "$3" in
            passing) eval "$_cmd" || touch "$_ex" ;;
            failing) eval "$_cmd" && touch "$_ex" ;;
            *)
                log "Unknown testing type: $3"
                touch "$_ex"
                ;;
            esac 2>&1
        } >"$pptest.log" 2>&1

        if [ -f "$_ex" ]; then
            rm -f -- "$_ex"

            log "Tests didn't pass! Check test log: $PWD/$pptest.log" >&2
            exit 1
        fi
    done

    cd ..
    echo
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
    log 'Checking dependencies'
    check_deps 'echo' rm mkdir cd touch exit

    log 'Preparing testing environment'

    rm -rf -- 'test_results'
    mmkdir 'test_results'
    cd test_results

    log 'Testing passing tests'
    run_tests 'passing_tests' ../tests/passing 'passing'

    log 'Testing failing tests'
    run_tests 'failing_tests' ../tests/failing 'failing'

    log 'Testing examples'
    run_tests 'example_tests' ../examples 'passing'

    log 'Testing low-level examples'
    run_tests 'll_example_tests' ../low-level-examples 'passing'
}

main "$@"
