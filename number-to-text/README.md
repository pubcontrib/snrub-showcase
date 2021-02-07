# number-to-text
> Program which takes an integer number and returns its representation in
English text.

## Running
A Shell script is included to provide a conversational interface for the
number-to-text program. This is included purely for convenience. Assuming both
`sh` and `snrub` are both available by those names you can run the program by
executing the prompt script.
```sh
sh prompt.sh
```

If you'd like to run the program directly, you can invoke the `snrub` program
directly with the entry script and number as arguments.
```sh
cd src
snrub -f entry.txt "#100#"
```

## Testing
Testing requires `sh` but can be an automated way to verify your version of
`snrub` executes this program's scripts correctly.
```sh
sh test/run.sh
```

Last tested with Snrub version `v0.52.1`.
