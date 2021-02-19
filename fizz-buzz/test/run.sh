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
    number=$1
    expected_output=$2
    expected_code=$3

    actual_output=`$snrub -f "entry.txt" "#$number#"`
    actual_code=$?

    if [ $actual_code != $expected_code ]
    then
        printf '[ERROR] Test case returned an unexpected exit code.\n' 1>&2
        printf 'Source: %d\n' $number 1>&2
        printf 'Expected: %d\n' $expected_code 1>&2
        printf 'Actual: %d\n' $actual_code 1>&2
        exit 1
    fi

    if [ "$actual_output" != "$expected_output" ]
    then
        printf '[ERROR] Test case returned an unexpected stdout.\n' 1>&2
        printf 'Source: %d\n' $number 1>&2
        printf 'Expected: %s\n' "$expected_output" 1>&2
        printf 'Actual: %s\n' "$actual_output" 1>&2
        exit 1
    fi

    count=$((count + 1))
}

cd "$src"

pass 0 '[]'
pass 1 '["1"]'
pass 2 '["1" "2"]'
pass 3 '["1" "2" "Fizz"]'
pass 4 '["1" "2" "Fizz" "4"]'
pass 5 '["1" "2" "Fizz" "4" "Buzz"]'
pass 6 '["1" "2" "Fizz" "4" "Buzz" "Fizz"]'
pass 7 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7"]'
pass 8 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8"]'
pass 9 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz"]'
pass 10 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz" "Buzz"]'
pass 11 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz" "Buzz" "11"]'
pass 12 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz" "Buzz" "11" "Fizz"]'
pass 13 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz" "Buzz" "11" "Fizz" "13"]'
pass 14 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz" "Buzz" "11" "Fizz" "13" "14"]'
pass 15 '["1" "2" "Fizz" "4" "Buzz" "Fizz" "7" "8" "Fizz" "Buzz" "11" "Fizz" "13" "14" "Fizz Buzz"]'

fail 'one' '#3#'
fail 'two' '#3#'
fail 'three' '#3#'
fail -1 '#3#'
fail -2 '#3#'
fail -3 '#3#'
fail -4 '#3#'
fail -5 '#3#'

printf '%d tests run.\n' $count
