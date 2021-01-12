#!/bin/sh
cd src

echo 'Welcome to number-to-text!'
echo 'What number would you like converted to text?'
read number
snrub -f entry.txt "#$number#"

error=$?
if [ $error -ne 0 ]
then
    echo 'I don'\''t think that is a valid integer.'
fi
