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

pass 0 '"zero"'
pass 1 '"one"'
pass 2 '"two"'
pass 3 '"three"'
pass 4 '"four"'
pass 5 '"five"'
pass 6 '"six"'
pass 7 '"seven"'
pass 8 '"eight"'
pass 9 '"nine"'
pass 10 '"ten"'
pass 11 '"eleven"'
pass 12 '"twelve"'
pass 13 '"thirteen"'
pass 14 '"fourteen"'
pass 15 '"fifteen"'
pass 16 '"sixteen"'
pass 17 '"seventeen"'
pass 18 '"eighteen"'
pass 19 '"nineteen"'
pass 20 '"twenty"'
pass 21 '"twenty-one"'
pass 25 '"twenty-five"'
pass 30 '"thirty"'
pass 40 '"forty"'
pass 50 '"fifty"'
pass 55 '"fifty-five"'
pass 60 '"sixty"'
pass 70 '"seventy"'
pass 80 '"eighty"'
pass 90 '"ninety"'
pass 100 '"one hundred"'
pass 101 '"one hundred one"'
pass 105 '"one hundred five"'
pass 110 '"one hundred ten"'
pass 115 '"one hundred fifteen"'
pass 120 '"one hundred twenty"'
pass 121 '"one hundred twenty-one"'
pass 125 '"one hundred twenty-five"'
pass 150 '"one hundred fifty"'
pass 155 '"one hundred fifty-five"'
pass 1000 '"one thousand"'
pass 5000 '"five thousand"'
pass 10000 '"ten thousand"'
pass 15000 '"fifteen thousand"'
pass 20000 '"twenty thousand"'
pass 25000 '"twenty-five thousand"'
pass 50000 '"fifty thousand"'
pass 55000 '"fifty-five thousand"'
pass 100000 '"one hundred thousand"'
pass 101000 '"one hundred one thousand"'
pass 105000 '"one hundred five thousand"'
pass 110000 '"one hundred ten thousand"'
pass 115000 '"one hundred fifteen thousand"'
pass 120000 '"one hundred twenty thousand"'
pass 121000 '"one hundred twenty-one thousand"'
pass 125000 '"one hundred twenty-five thousand"'
pass 150000 '"one hundred fifty thousand"'
pass 155000 '"one hundred fifty-five thousand"'
pass 200001 '"two hundred thousand, one"'
pass 200005 '"two hundred thousand, five"'
pass 200010 '"two hundred thousand, ten"'
pass 200015 '"two hundred thousand, fifteen"'
pass 200020 '"two hundred thousand, twenty"'
pass 200021 '"two hundred thousand, twenty-one"'
pass 200025 '"two hundred thousand, twenty-five"'
pass 200050 '"two hundred thousand, fifty"'
pass 200055 '"two hundred thousand, fifty-five"'
pass 200100 '"two hundred thousand, one hundred"'
pass 200101 '"two hundred thousand, one hundred one"'
pass 200105 '"two hundred thousand, one hundred five"'
pass 200110 '"two hundred thousand, one hundred ten"'
pass 200115 '"two hundred thousand, one hundred fifteen"'
pass 200120 '"two hundred thousand, one hundred twenty"'
pass 200121 '"two hundred thousand, one hundred twenty-one"'
pass 200125 '"two hundred thousand, one hundred twenty-five"'
pass 200150 '"two hundred thousand, one hundred fifty"'
pass 200155 '"two hundred thousand, one hundred fifty-five"'
pass 987654 '"nine hundred eighty-seven thousand, six hundred fifty-four"'
pass 999999 '"nine hundred ninety-nine thousand, nine hundred ninety-nine"'
pass 1000000 '"one million"'
pass 10000000 '"ten million"'
pass 20000000 '"twenty million"'
pass 100000000 '"one hundred million"'
pass 1000001 '"one million, one"'
pass 1000010 '"one million, ten"'
pass 1000020 '"one million, twenty"'
pass 1000100 '"one million, one hundred"'
pass 123456789 '"one hundred twenty-three million, four hundred fifty-six thousand, seven hundred eighty-nine"'
pass 987654321 '"nine hundred eighty-seven million, six hundred fifty-four thousand, three hundred twenty-one"'
pass 999999999 '"nine hundred ninety-nine million, nine hundred ninety-nine thousand, nine hundred ninety-nine"'

fail 'one' '#3#'
fail 'two' '#3#'
fail 'three' '#3#'
fail -1 '#3#'
fail -2 '#3#'
fail -3 '#3#'
fail -4 '#3#'
fail -5 '#3#'

printf '%d tests run.\n' $count
