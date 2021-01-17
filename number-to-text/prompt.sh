#!/bin/sh
snrub=${1:-snrub}
src=${2:-src}

cd "$src"

printf 'Welcome to number-to-text!\n'
printf 'What number would you like converted to text?\n'
read number

answer=`$snrub -f entry.txt "#$number#"`
status=$?

if [ $status -eq 0 ]
then
    printf '%s\n' "$answer"
else
    if [ "$answer" = '#3#' ]
    then
        printf 'I don'\''t think that is a valid integer.\n'
    elif [ "$answer" = '#6#' ]
    then
        printf 'I couldn'\''t access a required file.\n'
    else
        printf 'I don'\''t know what broke.\n'
    fi

    exit 1
fi
