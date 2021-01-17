#!/bin/sh
snrub=${1:-snrub}
src=${2:-src}
count=0

assert()
{
    number=$1
    expected_output="\"$2\""
    expected_code=0
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

assert 0 zero
assert 1 one
assert 5 five
assert 10 ten
assert 15 fifteen
assert 20 twenty
assert 21 twenty-one
assert 25 twenty-five
assert 50 fifty
assert 55 fifty-five
assert 100 'one hundred'
assert 101 'one hundred one'
assert 105 'one hundred five'
assert 110 'one hundred ten'
assert 115 'one hundred fifteen'
assert 120 'one hundred twenty'
assert 121 'one hundred twenty-one'
assert 125 'one hundred twenty-five'
assert 150 'one hundred fifty'
assert 155 'one hundred fifty-five'
assert 1000 'one thousand'
assert 5000 'five thousand'
assert 10000 'ten thousand'
assert 15000 'fifteen thousand'
assert 20000 'twenty thousand'
assert 25000 'twenty-five thousand'
assert 50000 'fifty thousand'
assert 55000 'fifty-five thousand'
assert 100000 'one hundred thousand'
assert 101000 'one hundred one thousand'
assert 105000 'one hundred five thousand'
assert 110000 'one hundred ten thousand'
assert 115000 'one hundred fifteen thousand'
assert 120000 'one hundred twenty thousand'
assert 121000 'one hundred twenty-one thousand'
assert 125000 'one hundred twenty-five thousand'
assert 150000 'one hundred fifty thousand'
assert 155000 'one hundred fifty-five thousand'
assert 200001 'two hundred thousand, one'
assert 200005 'two hundred thousand, five'
assert 200010 'two hundred thousand, ten'
assert 200015 'two hundred thousand, fifteen'
assert 200020 'two hundred thousand, twenty'
assert 200021 'two hundred thousand, twenty-one'
assert 200025 'two hundred thousand, twenty-five'
assert 200050 'two hundred thousand, fifty'
assert 200055 'two hundred thousand, fifty-five'
assert 200100 'two hundred thousand, one hundred'
assert 200101 'two hundred thousand, one hundred one'
assert 200105 'two hundred thousand, one hundred five'
assert 200110 'two hundred thousand, one hundred ten'
assert 200115 'two hundred thousand, one hundred fifteen'
assert 200120 'two hundred thousand, one hundred twenty'
assert 200121 'two hundred thousand, one hundred twenty-one'
assert 200125 'two hundred thousand, one hundred twenty-five'
assert 200150 'two hundred thousand, one hundred fifty'
assert 200155 'two hundred thousand, one hundred fifty-five'
assert 999999 'nine hundred ninety-nine thousand, nine hundred ninety-nine'

printf '%d tests run.\n' $count
