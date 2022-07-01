#!/usr/bin/env bash

set -e

RAN_TESTS=0
BOLD='\033[1m'
RESET='\033[0m'
BGREEN='\033[1;32m'
BRED='\033[1;31m'
FAC="${FAC:-fac}"

log() { printf " $BOLD*$RESET %s" "$1"; }
pass() { printf "${BGREEN}passed \u2713${RESET}\n"; }
fail() { printf "${BRED}failed \u2717${RESET}\n"; }

mmkdir() { mkdir -p -- "$1"; }

llog() {
    log "$1"
    echo
}

timer() {
    _end="$(date +%s,%N)"
    _e1="$(echo "$_end" | cut -d',' -f1)"
    _e2="$(echo "$_end" | cut -d',' -f2)"

    llog "$(printf "Tests $3 in $BOLD~%f$RESET seconds" \
        "$(bc <<<"scale=3; $_e1 - $1 + (($_e2 - $2) / 1000000000)")")"
}

run_tests() {
    echo
    mmkdir "$1"
    cd "$1"

    for ptest in ../"$2"/*; do
        RAN_TESTS="$((RAN_TESTS + 1))"

        pptest="${ptest##*/}"
        _ex="/tmp/fa.$RANDOM.$pptest.exit"

        log "$(printf "Running test $BOLD#%d$RESET ($BOLD%s$RESET mode): $BOLD%s$RESET... " "$RAN_TESTS" "$3" "$pptest")"

        {
            _cmd="echo | $FAC \"$ptest\" -run"

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

            {
                fail

                echo
                llog "Tests didn't pass! Check test log: $PWD/$pptest.log"
                timer "$4" "$5" "${BRED}failed${RESET}"
            } >&2

            exit 1
        else
            pass
        fi
    done

    cd ..
    echo
}

check_deps() {
    for dep in "$@"; do
        if ! command -v -- "$dep" >/dev/null; then
            llog "Unmet requirement (usually fixed by installing a package): '$dep'" >&2
            exit 1
        fi
    done
}

main() {
    llog 'Checking dependencies'
    check_deps 'echo' 'exit' "$FAC" 'rm' 'mkdir' 'cd' 'touch' 'exit' 'printf' 'date' 'bc'

    llog 'Preparing testing environment'

    rm -rf -- 'test_results'
    mmkdir 'test_results'
    cd test_results

    _start="$(date +%s,%N)"
    _s1="$(cut -d',' -f1 <<<"$_start")"
    _s2="$(cut -d',' -f2 <<<"$_start")"

    echo

    llog 'Testing passing tests'
    run_tests 'passing_tests' ../tests/passing 'passing' "$_s1" "$_s2"

    llog 'Testing failing tests'
    run_tests 'failing_tests' ../tests/failing 'failing' "$_s1" "$_s2"

    llog 'Testing examples'
    run_tests 'example_tests' ../examples 'passing' "$_s1" "$_s2"

    llog 'Testing low-level examples'
    run_tests 'll_example_tests' ../low-level-examples 'passing' "$_s1" "$_s2"

    timer "$_s1" "$_s2" "${BGREEN}passed${RESET}"
}

main "$@"
