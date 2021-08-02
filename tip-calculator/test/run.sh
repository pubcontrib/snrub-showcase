#!/bin/sh
snrub=${1:-snrub}
src=${2:-src}
count=0

pass()
{
    run_test "$1" "$2" 0
}

fail()
{
    run_test "$1" "$2" 1
}

run_test()
{
    arguments="$1"
    expected_output="$2"
    expected_code="$3"

    actual_output=`$snrub -f "entry.txt" "$arguments"`
    actual_code=$?

    if [ $actual_code != $expected_code ]
    then
        printf '[ERROR] Test case returned an unexpected exit code.\n' 1>&2
        printf 'Source: %s\n' "$arguments" 1>&2
        printf 'Expected: %d\n' "$expected_code" 1>&2
        printf 'Actual: %d\n' "$actual_code" 1>&2
        exit 1
    fi

    if [ $actual_output != "$expected_output" ]
    then
        printf '[ERROR] Test case returned an unexpected stdout.\n' 1>&2
        printf 'Source: %s\n' "$arguments" 1>&2
        printf 'Expected: %s\n' "$expected_output" 1>&2
        printf 'Actual: %s\n' "$actual_output" 1>&2
        exit 1
    fi

    count=$((count + 1))
}

cd "$src"

pass '[#15000#]' '#3000#'
pass '[#15000# #20#]' '#3000#'
pass '[#15000# #20# #2#]' '#3000#'
pass '[#10000# #1# #2#]' '#100#'
pass '[#10000# #10# #2#]' '#1000#'
pass '[#10000# #100# #2#]' '#10000#'
pass '[#1000# #1# #1#]' '#100#'
pass '[#1000# #10# #1#]' '#1000#'

fail '' '#4#'
fail '[]' '#3#'

printf '%d tests run.\n' $count
