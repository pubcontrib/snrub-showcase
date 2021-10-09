#!/bin/sh
snrub=${1:-snrub}

printf 'Welcome to number-to-text!\n'
printf 'What number would you like converted to text?\n'
read number

answer=`$snrub -f app.txt "#$number#"`
status=$?

if [ $status -eq 0 ]
then
    printf '%s\n' "$answer"
else
    if [ "$answer" = '#3#' ]
    then
        printf "I don't think that is a valid counting number.\n"
    else
        printf "I don't know what broke.\n"
    fi

    exit 1
fi
