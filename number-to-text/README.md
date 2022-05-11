# number-to-text

> Program which takes a counting number (0, 1, 2, ...) and returns that number
> in English cardinal word form.

## Rules

Numbers can take many forms in a language. There are times that you might wish
to spell out a number just as you'd pronounce it. For example when writing a
check to pay for something the document expects this word form to be considered
complete.

For example if the number was `155` the word form would be
`one hundred fifty-five`.

This program will do the translation for you using the rules of the English
language. The Snrub language can only store numbers up to but not including one
billion, so you're likely to see an error if you exceed that range.

## Running

A Shell script is included to provide a conversational interface for the
number-to-text program. This is included purely for convenience. Assuming both
`sh` and `snrub` are both available by those names you can run the program by
executing the prompt script.

    sh prompt.sh

If you'd like to run the program directly, you can invoke the `snrub` program
directly with the entry script and number as arguments.

    snrub -f app.txt "#100#"

## Testing

Testing can be an automated way to verify your version of `snrub` executes this
program's scripts correctly.

    snrub -f test.txt

Last tested with Snrub version `v0.82.0`.
