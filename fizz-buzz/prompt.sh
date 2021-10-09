#!/bin/sh
snrub=${1:-snrub}

printf 'Welcome to fizz-buzz!\n'
printf 'How many turns of the game would you like to see played out?\n'
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
